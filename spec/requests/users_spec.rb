require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:users) { User.all }

  describe "GET /index" do
    it "assigns all users to @users" do
      get "/users"
      expect(response).to render_template(:index)
      expect(assigns(:users)).to eq(users)
    end
  end

  describe "GET /new" do
    it "displays new user form" do
      get "/users/new"
      expect(response).to render_template(:new)
    end

    it "creates and displays new user on form submit" do
      get "/users/new"
      post "/users", :params => { 
        :user => {
          :first_name => "Alina", 
          :last_name => "Starkov"
        } 
      }
      expect(response).to redirect_to(assigns(:user))
      follow_redirect!

      expect(response).to render_template(:show)
      expect(response.body).to have_content "Alina Starkov"
    end
  end

  describe "GET /edit" do
    it "displays edit user form" do
      user = User.create(:first_name => "Alina", :last_name => "Starkov")

      get edit_user_path(user)

      expect(response).to render_template(:edit)
    end
  end

  describe "PATCH /edit" do
    it "changes user info" do
      user = User.create(:first_name => "Alina", :last_name => "Starkov")

      put user_path(User.last), :params => {
        :user => {
          :first_name => "Nina", :last_name => "Zenik"
        } 
      }
      expect(response).to redirect_to(assigns(:user))
      follow_redirect!

      expect(response).to render_template(:show)
      expect(response.body).to have_content "Nina Zenik"
    end
  end

  describe "DELETE /id" do
    it "removes user from database" do
      user = User.create(:first_name => "Alina", :last_name => "Starkov")

      delete user_path(User.last), :params => {
        :user => {
          :first_name => "Alina", :last_name => "Starkov"
        } 
      }
      expect(response).to redirect_to(root_path)
      follow_redirect!

      expect(response.body).not_to have_content "Alina Starkov"
    end
  end
end
