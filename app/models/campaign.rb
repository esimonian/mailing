class Campaign < ApplicationRecord
  
  belongs_to :template
  belongs_to :user

  validates_presence_of :user, :template_id, :title, :description

  enum status: %w(draft published)
end
