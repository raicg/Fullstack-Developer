 require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/admin/users", type: :request do
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    {
      full_name: FFaker::Name.name,
      email: FFaker::Internet.email,
      password: 'changeme',
      password_confirmation: 'changeme',
      avatar: Rack::Test::UploadedFile.new('spec/fixtures/user_avatar.jpg', 'image/jpg')
    }
  }

  let(:invalid_attributes) {
    {
      full_name: nil,
      email: nil,
      password: 'changeme',
      password_confirmation: 'changeme',
      avatar: Rack::Test::UploadedFile.new('spec/fixtures/user_avatar.jpg', 'image/jpg')
    }
  }

  describe "GET /index" do
    context 'with a no_admin user' do
      let!(:user) { create(:user) }
      before { sign_in(user) }

      it "returns http unauthorized" do
        get admin_users_url
        
        expect(response).to have_http_status(:unauthorized)
      end
    end
    context 'with a admin user' do
      let!(:user) { create(:user, role: 'admin') }
      before { sign_in(user) }

      it "returns http success" do
        get admin_users_url
        
        expect(response).to have_http_status(:success)
      end
    end
  end

  let!(:user) { create(:user, role: 'admin') }
  before { sign_in(user) }

  describe "GET /show" do
    it "renders a successful response" do
      get admin_user_url(user)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_admin_user_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      get edit_admin_user_url(user)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new User" do
        expect {
          post admin_users_url, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end

      it "redirects to the created user" do
        post admin_users_url, params: { user: valid_attributes }
        expect(response).to redirect_to(admin_user_url(User.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new User" do
        expect {
          post admin_users_url, params: { user: invalid_attributes }
        }.to change(User, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post admin_users_url, params: { user: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          full_name: 'Updated Name',
          email: FFaker::Internet.email,
          password: 'changeme',
          password_confirmation: 'changeme',
          avatar: Rack::Test::UploadedFile.new('spec/fixtures/user_avatar.jpg', 'image/jpg')
        }
      }

      it "updates the requested user" do
        patch admin_user_url(user), params: { user: new_attributes }
        user.reload
        expect(user.full_name).to eq('Updated Name')
      end

      it "redirects to the user" do
        patch admin_user_url(user), params: { user: new_attributes }
        user.reload
        expect(response).to redirect_to(admin_user_url(user))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        patch admin_user_url(user), params: { user: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested user" do
      expect {
        delete admin_user_url(user)
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      delete admin_user_url(user)
      expect(response).to redirect_to(admin_users_url)
    end
  end
end
