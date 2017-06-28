class AddListToCampaign < ActiveRecord::Migration[5.1]
  def change
    add_reference :campaigns, :list, foreign_key: true
  end
end
