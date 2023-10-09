require 'rails_helper'

RSpec.describe "/api/v1/partners/entities", type: :request do
  let(:created_entity) { FactoryBot.create(:entity) }

  let(:valid_attributes) {
    { name: "Test Entity", entity_type: "class", inep: '123', parent_id: created_entity.id }
  }

  let(:invalid_attributes) {
    { name: "Test Entity", entity_type: "class", parent_id: 'non-existent' }
  }

  let(:new_attributes) {
    { name: "Updated Entity", entity_type: "network", inep: '1234' }
  }

  let(:valid_headers) {
    {
      "Content-Type" => "application/json",
      "Accept" => "application/json"
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Entity.create! valid_attributes
      get api_v1_partners_entities_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      entity = Entity.create! valid_attributes
      get api_v1_partners_entity_url(entity), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Entity" do
        expect {
          post api_v1_partners_entities_url, params: { entity: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Entity, :count).by(2)
      end

      it "renders a JSON response with the new entity" do
        post api_v1_partners_entities_url, params: { entity: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Entity" do
        expect {
          post api_v1_partners_entities_url, params: { entity: invalid_attributes }, as: :json
        }.to change(Entity, :count).by(0)
      end

      it "renders a JSON response with errors for the new entity" do
        post api_v1_partners_entities_url, params: { entity: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      it "updates the requested entity" do
        entity = Entity.create! valid_attributes
        patch api_v1_partners_entity_url(entity), params: { entity: new_attributes }, headers: valid_headers, as: :json
        entity.reload
        expect(entity.name).to eq(new_attributes[:name])
        expect(entity.entity_type).to eq(new_attributes[:entity_type])
      end

      it "renders a JSON response with the entity" do
        entity = Entity.create! valid_attributes
        patch api_v1_partners_entity_url(entity), params: { entity: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the entity" do
        entity = Entity.create! valid_attributes
        patch api_v1_partners_entity_url(entity), params: { entity: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested entity" do
      entity = Entity.create! valid_attributes
      expect {
        delete api_v1_partners_entity_url(entity), headers: valid_headers, as: :json
      }.to change(Entity, :count).by(-1)
    end
  end
end
