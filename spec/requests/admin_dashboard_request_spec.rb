require 'rails_helper'

RSpec.describe "/admin/dashboard", type: :request do
  describe "GET /index" do
    context 'with a no_admin user' do
      let!(:user) { create(:user) }
      before { sign_in(user) }

      it "returns http unauthorized" do
        get admin_dashboard_index_url
        
        expect(response).to have_http_status(:unauthorized)
      end
    end
    context 'with a admin user' do
      let!(:user) { create(:user, role: 'admin') }
      before { sign_in(user) }

      it "returns http success" do
        get admin_dashboard_index_url
        
        expect(response).to have_http_status(:success)
      end
    end
  end
end
