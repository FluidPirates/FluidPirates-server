require 'rails_helper'

RSpec.describe API::GroupsController, type: :request do
  let(:user) { create(:user) }
  let(:token) { create(:token, user: user).value }

  describe "#index" do
    let!(:groups) { create_list(:group, 5) }

    subject do
      get "/api/groups", token: token
      json_response
    end

    it "return the group's name" do
      expect(subject.map { |group| group["name"] }).to include groups.first.name
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
    let(:name) { "Some Name" }
    let(:description) { "Some Description" }

    subject do
      post "/api/groups", token: token, group: { name: name, description: description }
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
    let(:group) { create(:group) }
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
    let!(:group) { create(:group) }

    subject do
      delete "/api/groups/#{group.id}", token: token
      json_response
    end

    it "deletes a group" do
      expect { subject }.to change { Group.count }.by(-1)
    end
  end
end
