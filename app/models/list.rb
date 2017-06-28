class List < ApplicationRecord
  has_many :contact_lists
  has_many :contacts, through: :contact_lists

  has_many :campaign_lists
  has_many :campaigns, through: :campaign_lists

  
end
