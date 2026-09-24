class User < ApplicationRecord
    
    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, authentication_keys: [:cpf]

    validates :cpf, presence: true
    validates :cpf, length: { is: 11 }, uniqueness: true, numericality: true, allow_blank: true

    validates :name_user, presence: true

    validates :phone_user, presence: true
    validates :phone_user, numericality: true, allow_blank: true

    def user_photo
        name_user.split.map(&:first).first(2).join.upcase rescue "AD" 
    end

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
