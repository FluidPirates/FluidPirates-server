require 'rails_helper'

RSpec.describe API::SessionsController, type: :request do
  describe "#create" do
    let(:email) { "john@example.com" }
    let(:correct_password) { "correct-password" }
    let(:incorrect_password) { "incorrect-password" }
    let!(:user) { create(:user, email: email, password: correct_password) }

    subject do
      post "/api/sessions", email: email, password: password
      JSON.parse(response.body)
    end

    context "with the correct password" do
      let(:password) { correct_password }

      it "has a success message" do
        expect(subject["message"]).to eq("Success")
      end
    end

    context "with the incorrect password" do
      let(:password) { incorrect_password }

      it "includes an error message" do
        expect(subject["message"]).to eq("Wrong password")
      end
    end
  end
end
