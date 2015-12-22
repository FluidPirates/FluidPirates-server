require 'rails_helper'

RSpec.describe API::SessionsController, type: :request do
  describe "#create" do
    let(:correct_password) { "correct-password" }
    let(:incorrect_password) { "incorrect-password" }
    let!(:user) { create(:user, password: correct_password) }

    subject do
      post "/api/sessions", session: { email: user.email, password: password }
      json_response
    end

    context "with the correct password" do
      let(:password) { correct_password }

      it "has a success message" do
        expect(subject["message"]).to eq("Logged in")
      end
    end

    context "with the incorrect password" do
      let(:password) { incorrect_password }

      it "includes an error message" do
        expect(subject["message"]).to eq("Wrong password")
      end
    end
  end

  describe "#destroy" do
    let!(:token) { create(:token) }
    subject { delete "/api/sessions", token: token.value }

    it "destroys the token" do
      expect { subject }.to change { Token.count }.by(-1)
    end
  end
end
