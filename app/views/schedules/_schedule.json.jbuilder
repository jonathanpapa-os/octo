json.extract! schedule, :id, :name, :gender, :phone, :birthday, :address, :email, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
