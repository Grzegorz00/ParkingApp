json.extract! booking, :id, :date, :release, :created_at, :updated_at
json.url booking_url(booking, format: :json)
