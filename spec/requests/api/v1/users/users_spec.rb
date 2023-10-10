require 'rails_helper'

RSpec.describe "/api/v1/users", type: :request do
  let(:user) { FactoryBot.create(:user) }

  let(:valid_attributes) {
    { email: "test@example.com", password: "password123" }
  }

  let(:invalid_attributes) {
    { email: "test@example.com", password: "" }
  }

  let(:valid_login_attributes) {
    { email: user.email, password: "password123" }
  }

  let(:invalid_login_attributes) {
    { email: user.email, password: "wrongpassword" }
  }

  let(:valid_headers) {
    {
      "Content-Type" => "application/json",
      "Accept" => "application/json"
    }
  }

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new User" do
        expect {
          post api_v1_users_create_url, params: { user: valid_attributes }, headers: valid_headers, as: :json
        }.to change(User, :count).by(1)
      end

      it "renders a JSON response with the new user" do
        post api_v1_users_create_url, params: { user: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new User" do
        expect {
          post api_v1_users_create_url, params: { user: invalid_attributes }, headers: valid_headers, as: :json
        }.to change(User, :count).by(0)
      end

      it "renders a JSON response with errors for the new user" do
        post api_v1_users_create_url, params: { user: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end

    context "when email already exists" do
      let!(:existing_user) { FactoryBot.create(:user, email: "test@example.com", password: "password123") }

      let(:duplicate_email_attributes) {
        { email: "test@example.com", password: "newpassword123" }
      }

      it "does not create a new User" do
        expect {
          post api_v1_users_create_url, params: { user: duplicate_email_attributes }, headers: valid_headers, as: :json
        }.to change(User, :count).by(0)
      end

      it "renders a JSON response with errors indicating email has been taken" do
        post api_v1_users_create_url, params: { user: duplicate_email_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
        parsed_response = JSON.parse(response.body)
        expect(parsed_response["message"]).to include("Email has already been taken")
      end
    end
  end
end
