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

RSpec.describe "/admin/user_bulks", type: :request do
  # UserBulk. As you add validations to UserBulk, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      UserBulk.create! valid_attributes
      get admin_user_bulks_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      user_bulk = UserBulk.create! valid_attributes
      get admin_user_bulk_url(user_bulk)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_admin_user_bulk_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      user_bulk = UserBulk.create! valid_attributes
      get edit_admin_user_bulk_url(user_bulk)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new UserBulk" do
        expect {
          post admin_user_bulks_url, params: { user_bulk: valid_attributes }
        }.to change(UserBulk, :count).by(1)
      end

      it "redirects to the created user_bulk" do
        post admin_user_bulks_url, params: { user_bulk: valid_attributes }
        expect(response).to redirect_to(admin_user_bulk_url(UserBulk.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new UserBulk" do
        expect {
          post admin_user_bulks_url, params: { user_bulk: invalid_attributes }
        }.to change(UserBulk, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post admin_user_bulks_url, params: { user_bulk: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested user_bulk" do
        user_bulk = UserBulk.create! valid_attributes
        patch admin_user_bulk_url(user_bulk), params: { user_bulk: new_attributes }
        user_bulk.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the user_bulk" do
        user_bulk = UserBulk.create! valid_attributes
        patch admin_user_bulk_url(user_bulk), params: { user_bulk: new_attributes }
        user_bulk.reload
        expect(response).to redirect_to(admin_user_bulk_url(user_bulk))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        user_bulk = UserBulk.create! valid_attributes
        patch admin_user_bulk_url(user_bulk), params: { user_bulk: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested user_bulk" do
      user_bulk = UserBulk.create! valid_attributes
      expect {
        delete admin_user_bulk_url(user_bulk)
      }.to change(UserBulk, :count).by(-1)
    end

    it "redirects to the user_bulks list" do
      user_bulk = UserBulk.create! valid_attributes
      delete admin_user_bulk_url(user_bulk)
      expect(response).to redirect_to(admin_user_bulks_url)
    end
  end
end