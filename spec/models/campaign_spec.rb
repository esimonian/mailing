require 'rails_helper'

RSpec.describe Campaign, type: :model do
  it { should belong_to :user }
  it { should belong_to :template }
  it { have_and_belong_to_many (:lists) }
  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :status }
  it { should validate_presence_of :user }
  it { should validate_presence_of :template }
end
