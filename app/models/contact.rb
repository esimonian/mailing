class Contact < ApplicationRecord
  has_address :address
  has_many :contact_lists
  has_many :lists, through: :contact_lists
end
