class Student < ApplicationRecord
    belongs_to :plan
    has_many :payments, dependent: :destroy

    def status_student
        if status == true
            return "Ativo"
        else
            return "Pendente"
        end
    end

    validates :name_student, presence: true
    validates :phone, length: { is: 11 }
    validates :cpf_student, presence: true
    validates :cpf_student, length: { is: 11 }, uniqueness: true, allow_blank: true

end
