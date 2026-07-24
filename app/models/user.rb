class User < ApplicationRecord

    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, authentication_keys: [:cpf]

    validates :cpf, presence: true, length: { is: 11 }, uniqueness: true, numericality: true

    validates :name_user, presence: true
    
    validates :phone_user, presence: true, length: { is: 9..11 }, numericality: true

    def email_required?
        false
    end

    def email_changed?
        false
    end

    def will_save_change_to_email?
        false
    end

    def self.find_for_database_authentication(warden_conditions)
        conditions = warden_conditions.dup
        cpf = conditions.delete(:cpf)
        where(cpf: cpf.strip).first
    end

private

def password_required?
  new_record? || password.present?
end
end
