class CreateContactLists < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_lists do |t|
      t.integer :contact_id
      t.integer :list_id

      t.timestamps
    end
    drop_table :contacts_lists
  end
end
