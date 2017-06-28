class CreateCampaignLists < ActiveRecord::Migration[5.1]
  def change
    create_table :campaign_lists do |t|
      t.integer :campaign_id
      t.integer :list_id

      t.timestamps
    end
  end
end
