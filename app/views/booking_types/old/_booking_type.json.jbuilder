json.extract! booking_type, :id, :name, :location, :color, :duration, :payment_required, :price, :user_id, :created_at, :updated_at
json.url booking_type_url(booking_type, format: :json)
