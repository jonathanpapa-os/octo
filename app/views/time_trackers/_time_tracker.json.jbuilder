json.extract! time_tracker, :id, :name, :email, :time_start, :time_end, :total_time, :created_at, :updated_at
json.url time_tracker_url(time_tracker, format: :json)
