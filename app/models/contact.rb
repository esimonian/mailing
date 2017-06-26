class Contact < ApplicationRecord
  has_address :address
  has_and_belongs_to_many :lists
end
