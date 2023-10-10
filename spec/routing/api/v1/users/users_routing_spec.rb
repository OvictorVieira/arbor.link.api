require "rails_helper"

RSpec.describe Api::V1::Users::UsersController, type: :routing do
  describe "routing" do

    it "routes to #create" do
      expect(post: "/api/v1/users/create").to route_to("api/v1/users/users#create")
    end

    it "routes to #login" do
      expect(post: "/api/v1/users/login").to route_to("api/v1/users/authentication#login")
    end

  end
end
