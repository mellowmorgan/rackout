json.extract! event, :id, :title, :description, :location, :start_time, :end_time, :is_work, :created_at, :updated_at
json.url event_url(event, format: :json)
