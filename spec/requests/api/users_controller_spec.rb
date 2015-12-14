require 'rails_helper'

RSpec.describe API::SessionsController, type: :request do
  describe "#current" do
    let!(:user) { create(:user) }
    let(:token) { }

    subject do
      get "/api/users/current", token: token
      json_response
    end

    context "when not connected" do
      it "renders an error" do
        expect(subject["message"]).to eq("Token missing")
      end
    end

    context "when connected" do
      let(:token) { Token.create_for_user(user) }

      it "returns the current user" do
        expect(subject["name"]).to eq(user.name)
      end
    end
  end

  describe "#create" do
    let(:name) { "Some Name" }
    let(:email) { "test@example.com" }
    let(:password) { "some-password" }

    subject do
      post "/api/users", user: { name: name, email: email, password: password }
      json_response
    end

    it "creates a new user" do
      expect { subject }.to change { User.count }.by(1)
    end

    it "returns a token" do
      expect(subject["token"]).to be_present
    end
  end
end
