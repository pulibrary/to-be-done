# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Items", type: :request do
  ITEM_TYPES = [:book, :tv_show, :movie, :music].freeze

  let(:user) { create(:user) }
  before do
    sign_in user
  end

  describe "GET /home" do
    it "renders :home template" do
      get root_path

      expect(response).to render_template :home
    end
  end

  describe "GET /index" do
    ITEM_TYPES.each do |item_type|
      it "renders :index template for #{item_type} item" do
        get polymorphic_path([user, item_type.to_s.pluralize.to_sym])

        expect(response).to render_template :index
      end
    end
  end

  describe "GET /show" do
    ITEM_TYPES.each do |item_type|
      it "renders :show template for #{item_type} item" do
        get polymorphic_path([user, create(item_type, user: user)])

        expect(response).to render_template :show
      end
    end
  end

  describe "GET /new" do
    ITEM_TYPES.each do |item_type|
      it "renders :new template for #{item_type} item" do
        get new_polymorphic_path([user, item_type])

        expect(response).to render_template :new
        expect(response).to render_template(partial: "_form")
      end
    end
  end

  describe "POST /create" do
    ITEM_TYPES.each do |item_type|
      it "redirects to item's page on successful #{item_type} item creation" do
        post polymorphic_path([user, item_type.to_s.pluralize.to_sym]),
          params: { item: attributes_for(item_type) }

        expect(response).to redirect_to polymorphic_path([user, user.items.last])
      end

      it "re-renders :new template on unsuccessful #{item_type} item creation" do
        post polymorphic_path([user, item_type.to_s.pluralize.to_sym]),
          params: { item: attributes_for(item_type, status: "") }

        expect(response).to render_template :new
      end
    end
  end

  describe "GET /edit" do
    ITEM_TYPES.each do |item_type|
      it "renders :edit template for #{item_type} item" do
        item = create(item_type, user: user)
        get edit_polymorphic_path([user, item])

        expect(response).to render_template :edit
        expect(response).to render_template(partial: "_form")
      end
    end
  end

  describe "PUT /update" do
    ITEM_TYPES.each do |item_type|
      it "redirects to item's page on successful #{item_type} item update" do
        item = create(item_type, user: user)
        put polymorphic_path([user, item]),
          params: { item: attributes_for(item_type, status: "In Progress") }

        expect(response).to redirect_to polymorphic_path([user, user.items.last])
      end

      it "re-renders :edit template on unsuccessful #{item_type} item update" do
        item = create(item_type, user: user)
        put polymorphic_path([user, item]),
          params: { item: attributes_for(item_type, status: " ") }

        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE /destroy" do
    ITEM_TYPES.each do |item_type|
      it "redirects to #{item_type} page after deleting #{item_type} item" do
        item = create(item_type, user: user)
        delete polymorphic_path([user, item])

        expect(user.items).not_to include item
        expect(response).to redirect_to polymorphic_path([user, item_type.to_s.pluralize.to_sym])
      end
    end
  end
end
