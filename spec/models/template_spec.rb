require 'rails_helper'

RSpec.describe Template, type: :model do
  it { should have_many(:campaigns) }
  it { should belong_to(:user) }
end
