# Reúne todos os números da página de estatísticas.
# Não é uma tabela do banco: é uma classe Ruby comum que faz as consultas.
class GymStatistics
  MONTHS = 6
  AGE_RANGES = {
    "Até 25"  => 0..25,
    "26 a 35" => 26..35,
    "36 a 45" => 36..45,
    "46 ou +" => 46..
  }.freeze

  attr_reader :today

  def initialize(today: Date.current)
    @today = today
  end

  # ===== Resumo =====

  def revenue(month = today)
    Payment.where(paid_at: month.all_month).sum(:amount)
  end

  def revenue_growth
    previous = revenue(today.prev_month)
    return if previous.zero?

    ((revenue - previous) / previous * 100).round(1)
  end

  def average_ticket
    count = Payment.where(paid_at: today.all_month).count
    count.zero? ? 0 : revenue / count
  end

  def total_students
    @total_students ||= Student.count
  end

  def new_students
    Student.where(created_at: today.all_month).count
  end

  def active_students
    latest_due_dates.count { |_id, due| due >= today }
  end

  def overdue_students
    latest_due_dates.count { |_id, due| due < today }
  end

  def expiring_soon
    latest_due_dates.count { |_id, due| due.between?(today, today + 7) }
  end

  # Valor que entraria se todos os alunos vencidos renovassem o plano atual.
  def overdue_amount
    overdue_ids = latest_due_dates.select { |_id, due| due < today }.keys
    Student.where(id: overdue_ids).joins(:plan).sum("plans.price")
  end

  # ===== Renovações =====

  # Alunos cujo plano venceu no mês e quantos deles pagaram de novo.
  def renewals(month = today)
    expired = Payment.where(due_date: expired_range(month)).group(:student_id).maximum(:due_date)
    renewed = expired.count { |id, due| latest_due_dates[id] > due }

    { expired: expired.size, renewed: renewed }
  end

  def renewal_rate(month = today)
    data = renewals(month)
    percent(data[:renewed], data[:expired])
  end

  def dropout_rate
    data = renewals
    percent(data[:expired] - data[:renewed], total_students)
  end

  # ===== Séries para os gráficos =====

  def revenue_by_month
    totals = Payment.where(paid_at: first_month..).group(month_of(Payment.arel_table[:paid_at])).sum(:amount)
    months.map { |month| { month: month, value: totals[month] || 0 } }
  end

  # Matrículas = alunos cadastrados no mês.
  # Evasões = planos que venceram no mês e não foram renovados.
  def enrollments_by_month
    created = Student.where(created_at: first_month..).group(month_of(Student.arel_table[:created_at])).count

    months.map do |month|
      data = renewals(month)
      { month: month, new: created[month] || 0, lost: data[:expired] - data[:renewed] }
    end
  end

  def payment_methods
    # O campo é texto livre: "pix", " PIX " e "Pix" viram o mesmo item.
    totals = Payment.where(paid_at: today.all_month)
                    .group(Arel.sql("LOWER(TRIM(payment_method))"))
                    .sum(:amount)
                    .each_with_object(Hash.new(0)) { |(name, value), sum| sum[name.presence&.capitalize || "Não informado"] += value }

    with_percent(totals.sort_by { |_name, value| -value })
  end

  def students_by_plan
    with_percent(Student.joins(:plan).group("plans.name_plan").order(count_all: :desc).count)
  end

  def students_by_age
    ages = Student.where.not(birth_date: nil).pluck(:birth_date).map { |birth| age(birth) }
    counts = AGE_RANGES.transform_values { |range| ages.count { |a| range.cover?(a) } }

    with_percent(counts)
  end

  private

  # { aluno_id => data de vencimento do pagamento mais recente }
  def latest_due_dates
    @latest_due_dates ||= Payment.group(:student_id).maximum(:due_date).compact
  end

  # Vencimentos do mês que já passaram (o mês atual só conta até ontem).
  def expired_range(month)
    month.beginning_of_month..[ month.end_of_month, today - 1 ].min
  end

  def months
    (0...MONTHS).map { |i| first_month >> i }
  end

  def first_month
    today.beginning_of_month << (MONTHS - 1)
  end

  def month_of(attribute)
    month = Arel::Nodes.build_quoted("month")
    trunc = Arel::Nodes::NamedFunction.new("DATE_TRUNC", [ month, attribute ])
    Arel::Nodes::NamedFunction.new("CAST", [ trunc.as("date") ])
  end

  def age(birth)
    today.year - birth.year - (today < birth + (today.year - birth.year).years ? 1 : 0)
  end

  def percent(part, total)
    total.zero? ? 0 : (part * 100.0 / total).round
  end

  # [[nome, valor], ...] -> [{ label:, value:, percent: }, ...]
  def with_percent(pairs)
    total = pairs.sum { |_label, value| value }
    pairs.map { |label, value| { label: label, value: value, percent: percent(value, total) } }
  end
end
