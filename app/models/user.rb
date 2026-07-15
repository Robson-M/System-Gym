class User < ApplicationRecord
    has_one :student, dependent: :destroy
    
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, authentication_keys: [:cpf]

    def email_required?
        false
    end
    
    def email_changed?
        false
    end

    def will_save_change_to_email?
        false
    end
    
    enum :role, { admin: "admin", user: "user" }

    validates :cpf, presence: true, length: { is: 11 }, uniqueness: true, numericality: true
    validates :role, presence: true
end
