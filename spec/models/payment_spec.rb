require 'rails_helper'

RSpec.describe Payment, type: :model do
  it { should belongs_to(:student) }
end
