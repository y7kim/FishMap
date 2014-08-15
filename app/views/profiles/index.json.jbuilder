json.array!(@profiles) do |profile|
  json.extract! profile, :id, :name, :birthday, :bio, :color, :twitter
  json.url profile_url(profile, format: :json)
end
