json.array!(@friends) do |friend|
  json.extract! friend, :id, :name, :gender, :birthday
  json.url friend_url(friend, format: :json)
end
