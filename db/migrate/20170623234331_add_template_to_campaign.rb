class AddTemplateToCampaign < ActiveRecord::Migration[5.1]
  def change
    add_reference :campaigns, :template, foreign_key: true
  end
end
