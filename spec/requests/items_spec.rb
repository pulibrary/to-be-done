# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Items", type: :request do
  let(:user) { create(:user) }
  before { sign_in user }

  describe "GET /index" do
    it "renders index template" do
      get user_items_path(user)

      expect(response).to render_template :index
    end
  end

  describe "GET /new" do
    it "renders new template" do
      get new_user_item_path(user)

      expect(response).to render_template :new
    end
  end
end
