json.array!(@propositions) do |proposition|
  json.extract! proposition, :id, :name, :poll_id
  json.url proposition_url(proposition, format: :json)
end
