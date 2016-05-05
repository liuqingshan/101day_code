json.array!(@productions) do |production|
  json.extract! production, :id, :name
  json.url production_url(production, format: :json)
end
