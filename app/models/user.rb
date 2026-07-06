class User < ApplicationRecord
    has_one :student, dependent: :destroy

    validates :cpf, presence: true, length: { is: 11 }, uniqueness: true, numericality: true
    validates :password_digest, presence: true, length: { in: 6..10 }, numericality: true

    devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

    enum :role, { admin: 1, user: 0 }
    validates :role, presence: true
end
