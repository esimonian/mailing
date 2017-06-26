class AddUserToCampaign < ActiveRecord::Migration[5.1]
  def change
    add_reference :campaigns, :user, :reference
  end
end
