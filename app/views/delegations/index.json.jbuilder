json.array!(@delegations) do |delegation|
  json.extract! delegation, :id, :delegee_id, :representative_id, :category_id
  json.url delegation_url(delegation, format: :json)
end
