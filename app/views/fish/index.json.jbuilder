json.array!(@fish) do |fish|
  json.extract! fish, :id, :name, :latitude, :longitude, :caught, :description
  json.url fish_url(fish, format: :json)
end
