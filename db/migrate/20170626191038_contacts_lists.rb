class ContactsLists < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts_lists do |t|
      t.belongs_to :contact, index: true
      t.belongs_to :list, index: true
    end
  end
end
