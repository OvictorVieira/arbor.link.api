require 'rails_helper'

RSpec.describe "/api/v1/users", type: :request do
  let(:user) { FactoryBot.create(:user, email: "test@example.com", password: "password123") }
  let(:valid_headers) {
    {
      "Content-Type" => "application/json",
      "Accept" => "application/json"
    }
  }

  describe "POST /login" do
    context "with valid credentials" do
      let(:valid_credentials) {
        {
          user: {
            email: user.email,
            password: "password123"
          }
        }
      }

      it "returns a JWT token" do
        post api_v1_users_login_url, params: valid_credentials, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response["token"]).not_to be_nil
      end
    end

    context "with invalid credentials" do
      let(:invalid_credentials) {
        {
          user: {
            email: user.email,
            password: "wrongpassword"
          }
        }
      }

      it "returns an unauthorized error" do
        post api_v1_users_login_url, params: invalid_credentials, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unauthorized)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response["error"]).to eq("Unauthorized")
      end
    end

    context "with non-existent email" do
      let(:non_existent_email_credentials) {
        {
          user: {
            email: "nonexistent@example.com",
            password: "password123"
          }
        }
      }

      it "returns an unauthorized error" do
        post api_v1_users_login_url, params: non_existent_email_credentials, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unauthorized)
        parsed_response = JSON.parse(response.body)
        expect(parsed_response["error"]).to eq("Unauthorized")
      end
    end
  end
end
