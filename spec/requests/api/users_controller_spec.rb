require 'rails_helper'

RSpec.describe API::SessionsController, type: :request do
  describe "#current" do
    let!(:user) { create(:user) }
    let(:token) { }

    subject do
      get "/api/users/current", token: token
      JSON.parse(response.body)
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
end
