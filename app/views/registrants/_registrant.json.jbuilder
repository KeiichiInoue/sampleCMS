json.extract! registrant, :id, :name, :device_info, :device_type, :created_at, :updated_at
json.url registrant_url(registrant, format: :json)
