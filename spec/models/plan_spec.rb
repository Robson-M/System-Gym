require 'rails_helper'

RSpec.describe Plan, type: :model do
  it { should have_many(:students) }
end
