class Campaign < ApplicationRecord
  
  has_one :template
  has_one :user

  belongs_to :template
  belongs_to :user

  validates_presence_of :user, :template, :title, :description, :status
end
