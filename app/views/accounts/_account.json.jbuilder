json.extract! account, :id, :slug, :name, :description, :created_at, :updated_at
json.url account_url(account, format: :json)
