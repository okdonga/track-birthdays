json.array!(@presents) do |present|
  json.extract! present, :id, :title, :description, :price, :date_purcahsed
  json.url present_url(present, format: :json)
end
