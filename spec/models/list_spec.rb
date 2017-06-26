require 'rails_helper'

RSpec.describe List, type: :model do
  it { have_and_belong_to_many (:contacts) }
  it { have_and_belong_to_many (:campaigns) }
end
