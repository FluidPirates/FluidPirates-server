require 'rails_helper'

RSpec.describe "Voting flow", type: :request do
  it "does not raise any exception" do
    get "/"
    expect(response.body).to include("API")

    user_attributes = {
      name: "Some one",
      email: "someone@example.com",
      password: "somepassword"
    }

    post "/api/users", user: user_attributes
    assert_response 200

    token = json_response["token"]

    get "/api/users/current", token: token
    assert_response 200
    delete "/api/sessions", token: token
    assert_response 200
    post "/api/sessions", user_attributes
    assert_response 200

    token = json_response["token"]

    post "/api/groups", token: token, group: build(:group).attributes
    assert_response 200
    get "/api/groups", token: token
    assert_response 200

    group_id = json_response.first["id"]
    group_url = "/api/groups/#{group_id}"

    post "#{group_url}/categories", token: token, poll: build(:category).attributes
    assert_response 200
    get "#{group_url}/categories", token: token
    assert_response 200

    category_id = json_response.first["id"]
    category_url = "#{group_url}/categories/#{category_id}"

    post "#{category_url}/polls", token: token, poll: build(:poll).attributes
    assert_response 200
    get "#{category_url}/polls", token: token
    assert_response 200

    poll_id = json_response.first["id"]
    poll_url = "#{category_url}/polls/#{poll_id}"

    post "#{poll_url}/propositions", token: token, proposition: build(:proposition).attributes
    assert_response 200
    get "#{poll_url}/propositions", token: token
    assert_response 200

    proposition_id = json_response.first["id"]
    proposition_url = "#{poll_url}/propositions/#{proposition_id}"

    post "#{proposition_url}/choices", token: token, choice: build(:choice).attributes
    assert_response 200
    get "#{proposition_url}/choices", token: token
    assert_response 200

    choice_id = json_response.first["id"]
    choice_url = "#{proposition_url}/choices/#{choice_id}"

    post "#{choice_url}/votes", token: token
    assert_response 200
    get "#{choice_url}/votes", token: token
    assert_response 200
    get "#{choice_url}/votes/current", token: token
    assert_response 200
  end
end
