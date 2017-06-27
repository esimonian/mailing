require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:campaigns) }
  it { should have_many(:templates) }
  it { should have_many(:lists) }
  it { should have_many(:contacts) }
  it "has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it "is valid with a first name, last name and email, and password" do
    user = User.new(
      first_name: "Aaron",
      last_name:  "Sumner",
      email:      "tester@example.com",
      password:   "dottle-nouveau-pavilion-tights-furze",
      username:   "Asumner",
      location:   "Los Angeles, CA"
    )
    expect(user).to be_valid
  end

  it "is invalid without a first name" do
    user = FactoryGirl.build(:user, first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  it "is invalid without a last name" do
    user = FactoryGirl.build(:user, last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end

  it "is invalid without a username " do
    user = FactoryGirl.build(:user, username: nil)
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")
  end

  it "is invalid without a location" do
    user = FactoryGirl.build(:user, location: nil)
    user.valid?
    expect(user.errors[:location]).to include("can't be blank")
  end


  it "is invalid without an email address" do
    user = FactoryGirl.build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid with a duplicate email address" do
    FactoryGirl.create(:user, email: "aaron@example.com")
    user = FactoryGirl.build(:user, email: "aaron@example.com")
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end

  it "returns a user's full name as a string" do
    user = FactoryGirl.build(:user, first_name: "John", last_name: "Doe")
    expect(user.name).to eq "John Doe"
  end
end