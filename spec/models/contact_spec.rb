require 'rails_helper'

RSpec.describe Contact, type: :model do
  it { have_and_belong_to_many (:lists) }
end
