class ChangeStatusCampaigns < ActiveRecord::Migration[5.1]
  def change
    change_column :campaigns, :status, 'integer USING CAST(status AS integer)', default: 0
  end
end
