require 'rails_helper'

RSpec.describe "Users", type: :request do
  let(:users) { User.all }

  describe "GET /index" do
    it "assigns all users to @users" do
      get "/users" 
      expect(assigns(:users)).to eq(users)
    end
  end
end
