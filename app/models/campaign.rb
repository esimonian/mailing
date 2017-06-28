class Campaign < ApplicationRecord
  
  belongs_to :template
  belongs_to :user
  has_many :campaign_lists
  has_many :lists, through: :campaign_lists

  validates_presence_of :user, :template_id, :title, :description

  enum status: %w(draft published)
end
