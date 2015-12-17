require 'rails_helper'

RSpec.describe API::GroupsController, type: :request do
  let!(:user) { create(:user) }
  let!(:token) { create(:token, user: user).value }
  let!(:group) { create(:group) }
  let!(:membership) { create(:membership, group: group, user: user, role: "admin") }

  describe "#index" do
    subject do
      get "/api/groups", token: token
      json_response
    end

    it "returns all the groups" do
      expect(subject.size).to eq Group.count
    end
  end

  describe "#current" do
    subject do
      get "/api/groups/current", token: token
      json_response
    end

    it "returns only the groups the user is member of" do
      expect(subject.size).to eq 1
    end
  end

  describe "#show" do
    let(:group) { create(:group) }

    subject do
      get "/api/groups/#{group.id}", token: token
      json_response
    end

    it "return the group's name" do
      expect(subject["name"]).to eq group.name
    end
  end

  describe "#create" do
    subject do
      post "/api/groups", token: token, group: build(:group).attributes
      json_response
    end

    it "creates a new group" do
      expect { subject }.to change { Group.count }.by(1)
    end

    it "doesn't return an error" do
      expect(subject["message"]).to eq("Success")
    end
  end

  describe "#update" do
    let(:description) { "Changed Description" }

    subject do
      patch "/api/groups/#{group.id}", token: token, group: { description: description }
      json_response
    end

    it "updates the group" do
      expect { subject }.to change { group.reload.description }
    end
  end

  describe "#update" do
    subject do
      delete "/api/groups/#{group.id}", token: token
      json_response
    end

    it "deletes a group" do
      expect { subject }.to change { Group.count }.by(-1)
    end
  end
end
