require 'rails_helper'

RSpec.describe Payment, type: :model do
  it { should belong_to(:student).without_validating_presence }
end
