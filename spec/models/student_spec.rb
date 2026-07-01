require 'rails_helper'

RSpec.describe Student, type: :model do
  subject { build(:student) }
  it { should validate_presence_of(:name_student) }
  it { should belong_to(:user) }
  it { should belong_to(:plan) }
  it { should have_many(:payments).dependent(:destroy) }
end
