class Campaign < ApplicationRecord
  
  belongs_to :template
  belongs_to :user
  has_many :campaign_lists
  has_many :lists, through: :campaign_lists

  validates_presence_of :user, :template_id, :title, :description

  enum status: %w(draft sent recieved printing closed)


# refactor this

  def all_contacts
    contacts  = []
      lists.each do |list|
        list.contacts.each do |contact|
          contacts << contact
        end
    end
    contacts
  end

  def to_csv
    CSV.generate() do |csv|

    end
  end
end
