require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:cpf) }
  it { should validate_uniqueness_of(:cpf).case.insensitive }
  it { should validate_presence_of(:password_digest) }
  it { should have_many(:student).dependent(:destroy) }
end
