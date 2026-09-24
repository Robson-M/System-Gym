class Plan < ApplicationRecord
    has_many :students
    has_many :payments, dependent: :nullify

    def formatted_duration
        if duration_days&. >= 365
            "#{(duration_days / 365).round} Ano(s)"
        elsif duration_days&. >= 90
            "#{(duration_days / 90).round} Trimestral"
        elsif duration_days&. >= 30
            "#{(duration_days / 30).round} Mês(es)"
        else
            "#{duration_days} Dia(s)"
        end
    end

    def formatted_active
        if active
            "Ativo"
        else
            "Inativo"        
        end
    end

end
