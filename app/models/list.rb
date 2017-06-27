class List < ApplicationRecord
  has_and_belongs_to_many :contacts, join_table: "contacts_lists"
end
