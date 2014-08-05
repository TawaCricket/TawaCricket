json.array!(@images) do |image|
  json.extract! image, :id, :img_name
  json.url image_url(image, format: :json)
end
