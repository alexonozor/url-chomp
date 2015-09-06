json.array!(@shorters) do |shorter|
  json.extract! shorter, :id, :long_url, :short_url, :click, :user_id
  json.url shorter_url(shorter, format: :json)
end
