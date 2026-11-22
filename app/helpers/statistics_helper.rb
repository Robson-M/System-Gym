module StatisticsHelper
  CHART_COLORS = %w[primary accent secondary active inactive danger].freeze

  # Cor da legenda pela posição do item (1º primary, 2º accent...).
  def chart_color(index)
    CHART_COLORS[index % CHART_COLORS.size]
  end

  # Altura/largura de uma barra em relação ao maior valor da série.
  def bar_percent(value, max)
    max.to_f.zero? ? 0 : (value * 100.0 / max).round
  end

  # 18420 -> "18,4 mil"
  def short_money(value)
    number_to_human(value, precision: 3, significant: true, units: { unit: "", thousand: "mil", million: "mi" })
  end

  def money(value)
    number_to_currency(value, precision: 0)
  end

  def month_name(date)
    l(date, format: "%b").capitalize
  end

  # Monta o "conic-gradient" do gráfico de rosca a partir dos percentuais.
  def donut_gradient(items)
    start = 0
    slices = items.each_with_index.map do |item, index|
      finish = start + item[:percent]
      slice = "var(--color-#{chart_color(index)}) #{start}% #{finish}%"
      start = finish
      slice
    end

    "background: conic-gradient(#{slices.join(', ')}, var(--color-inactive) 0)"
  end
end
