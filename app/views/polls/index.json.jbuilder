json.array!(@polls) do |poll|
  json.extract! poll, :id, :name, :user_id, :category_id
  json.url poll_url(poll, format: :json)
end
