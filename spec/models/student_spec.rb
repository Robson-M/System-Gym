require 'rails_helper'

RSpec.describe Student, type: :model do
  it { should validate_presence_of(:name_student) }
  it { should belongs_to(:user) }
  it { should belongs_to(:plan) }
  it { should have_many(:payment).dependent(:destroy) }
end
