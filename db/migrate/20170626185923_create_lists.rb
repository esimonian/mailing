class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.string :title
      t.integer :user_id, foreign_key: true

      t.timestamps
    end
  end
end
