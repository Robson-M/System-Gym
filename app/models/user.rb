class User < ApplicationRecord
    has_one :student, dependent: :destroy

    validates :cpf, presence: true, length: {is: 11}, uniqueness: true, numericality: true
    validates :password_digest, length: {in: 6..10}, numericality: true

    enum :role, { admin: "admin", user: "user" }
    validates :role, presence: true
end
