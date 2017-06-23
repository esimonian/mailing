class CreateCampaigns < ActiveRecord::Migration[5.1]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :description
      t.string :status

      t.timestamps
    end
  end
end
