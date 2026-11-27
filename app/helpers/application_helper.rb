module ApplicationHelper
    # Avisos do sino no header. Guarda o resultado para não consultar
    # o banco duas vezes na mesma página.
    def gym_notices
        @gym_notices ||= begin
            today = Date.current
            {
                birthdays: Student.birthdays_on(today).order(:name_student).to_a,
                new_students: Student.created_on(today).includes(:plan).order(created_at: :desc).to_a
            }
        end
    end

    def avatar_initials(full_name)
        return "" if full_name.blank?

        words = full_name.strip.split

        if words.length > 1
            "#{words.first[0]}#{words.last[0]}".upcase
        else
            words.first[0..1].upcase
        end
    end
end
