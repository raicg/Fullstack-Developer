require "rails_helper"

RSpec.describe Admin::UserBulksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/admin/user_bulks").to route_to("admin/user_bulks#index")
    end

    it "routes to #new" do
      expect(get: "/admin/user_bulks/new").to route_to("admin/user_bulks#new")
    end

    it "routes to #create" do
      expect(post: "/admin/user_bulks").to route_to("admin/user_bulks#create")
    end
  end
end
