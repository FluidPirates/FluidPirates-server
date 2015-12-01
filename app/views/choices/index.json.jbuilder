json.array!(@choices) do |choice|
  json.extract! choice, :id, :name, :proposition_id
  json.url choice_url(choice, format: :json)
end
