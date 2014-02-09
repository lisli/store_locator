json.array!(@stores) do |store|
  json.extract! store, :id, :name, :phone_number, :city, :state, :state_abbr, :zip, :country
  json.url store_url(store, format: :json)
end
