require 'rails_helper'

RSpec.describe "Voting flow", type: :request do
  it "lets the user creates everything necessary to vote" do
    get "/"
    expect(response.body).to include("API")

    user_attributes = build(:user).attributes.merge(password: "somepassword")

    other_user_attributes = build(:user).attributes.merge(password: "someotherpassword")

    post "/api/users", user: user_attributes
    assert_response_200

    token = json_response["token"]

    post "/api/users", user: other_user_attributes
    assert_response_200

    other_token = json_response["token"]

    get "/api/users/current", token: token
    assert_response_200

    user_id = json_response["id"]

    get "/api/users/current", token: other_token
    assert_response_200

    other_user_id = json_response["id"]

    delete "/api/sessions", token: token
    assert_response_200
    post "/api/sessions", user_attributes
    assert_response_200

    token = json_response["token"]

    post "/api/groups", token: token, group: build(:group).attributes
    assert_response_200
    get "/api/groups", token: token
    assert_response_200
    get "/api/groups/current", token: token
    assert_response_200

    group_id = json_response.first["id"]
    group_url = "/api/groups/#{group_id}"

    invitation = build(:invitation, email: other_user_attributes["email"])

    post "#{group_url}/invitations", token: token, invitation: invitation.attributes
    assert_response_200
    get "#{group_url}/invitations", token: token
    assert_response_200

    invitation_key = json_response.last["key"]

    post "#{group_url}/invitations/accept", token: other_token, key: invitation_key
    assert_response_200

    post "#{group_url}/memberships", token: token, membership: build(:membership).attributes
    assert_response_200
    get "#{group_url}/memberships", token: token
    assert_response_200

    membership_id = json_response.detect { |m| m["user"].try(:[], "id") == other_user_id }["id"]
    membership_url = "#{group_url}/memberships/#{membership_id}"

    patch "#{membership_url}", token: token, membership: { role: "admin" }
    assert_response_200

    post "#{group_url}/categories", token: token, category: build(:category).attributes
    assert_response_200
    get "#{group_url}/categories", token: token
    assert_response_200

    category_id = json_response.first["id"]
    category_url = "#{group_url}/categories/#{category_id}"

    post "#{category_url}/delegations", token: token, delegation: { delegate_id: other_user_id }
    assert_response_200
    get "#{category_url}/delegations", token: token
    assert_response_200

    post "#{category_url}/polls", token: token, poll: build(:poll).attributes
    assert_response_200
    get "#{category_url}/polls", token: token
    assert_response_200

    poll_id = json_response.first["id"]
    poll_url = "#{category_url}/polls/#{poll_id}"

    post "#{poll_url}/propositions", token: token, proposition: build(:proposition).attributes
    assert_response_200
    get "#{poll_url}/propositions", token: token
    assert_response_200

    proposition_id = json_response.first["id"]
    proposition_url = "#{poll_url}/propositions/#{proposition_id}"

    post "#{proposition_url}/choices", token: token, choice: build(:choice).attributes
    assert_response_200
    get "#{proposition_url}/choices", token: token
    assert_response_200

    choice_id = json_response.first["id"]
    choice_url = "#{proposition_url}/choices/#{choice_id}"

    post "#{choice_url}/votes", token: token
    assert_response_200
    get "#{choice_url}/votes", token: token
    assert_response_200
    get "#{choice_url}/votes/current", token: token
    assert_response_200
  end
end
