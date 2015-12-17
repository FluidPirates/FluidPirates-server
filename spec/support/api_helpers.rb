def json_response
  JSON.parse(response.body)
rescue
  response.body
end

def assert_response_200
  assert_response 200, "Response code: #{response.status}, content: #{json_response}"
end
