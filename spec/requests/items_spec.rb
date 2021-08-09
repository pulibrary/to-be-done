# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Items", type: :request do
  let(:user) { create(:user) }
  let(:item) { create(:item, user: user) }
  before { sign_in user }

  describe "GET /index" do
    it "renders :index template" do
      get user_items_path(user)

      expect(response).to render_template :index
    end
  end

  describe "GET /show" do
    it "renders :show template" do
      get user_item_path(user, item)

      expect(response).to render_template :show
    end
  end

  describe "GET /new" do
    it "renders :new template" do
      get new_user_item_path(user)

      expect(response).to render_template :new
      expect(response).to render_template(partial: "_form")
    end
  end

  describe "POST /create" do
    it "redirects to item's page on successful item creation" do
      post user_items_path(user), params: { item: attributes_for(:item) }

      expect(response).to redirect_to user_item_path(user, user.items.last)
    end

    it "re-renders :new template on unsuccessful item creation" do
      post user_items_path(user), params: { item: attributes_for(:item, status: "") }

      expect(response).to render_template :new
    end
  end

  describe "GET /edit" do
    it "renders :edit template" do
      get edit_user_item_path(user, item)

      expect(response).to render_template :edit
      expect(response).to render_template(partial: "_form")
    end
  end

  describe "PUT /update" do
    it "redirects to item's page on successful item update" do
      put user_item_path(user, item), params: { item: attributes_for(:item, status: "In Progress") }

      expect(response).to redirect_to user_item_path(user, user.items.last)
    end

    it "re-renders :edit template on unsuccessful item update" do
      put user_item_path(user, item), params: { item: attributes_for(:item, status: "") }

      expect(response).to render_template :edit
    end
  end

  describe "DELETE /destroy" do
    it "redirects home on successful item deletion" do
      delete user_item_path(user, item)

      expect(user.items).not_to include item
      expect(response).to redirect_to user_items_path(user)
    end
  end
end
