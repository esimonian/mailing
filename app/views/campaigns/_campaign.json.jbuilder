json.extract! campaign, :id, :title, :description, :status, :created_at, :updated_at
json.url campaign_url(campaign, format: :json)
