require 'rails_helper'

RSpec.describe User, type: :model do
  subject { build(:user) }
  it { should validate_presence_of(:cpf) }
  it { should validate_uniqueness_of(:cpf).case_insensitive }
  it { should validate_presence_of(:password_digest) }
  it { should have_one(:student).dependent(:destroy) }
end
