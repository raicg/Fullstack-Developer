require 'rails_helper'

RSpec.describe "/user/profile", type: :request do

  let!(:user) { create(:user) }
  before { sign_in(user) }

  describe "GET /profile" do
    it "returns http success" do
      get user_profile_url
      expect(response).to have_http_status(:success)
    end
  end

end
