# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Items", type: :request do
  ITEM_TYPES = [:book, :tv_show].freeze

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
    include_examples "renders :index template", ITEM_TYPES
  end

  describe "GET /show" do
    include_examples "renders :show template", ITEM_TYPES
  end

  describe "GET /new" do
    include_examples "renders :new template", ITEM_TYPES
  end

  describe "POST /create" do
    include_examples "creates item", ITEM_TYPES
  end

  describe "GET /edit" do
    include_examples "renders :edit template", ITEM_TYPES
  end

  describe "PUT /update" do
    include_examples "updates item", ITEM_TYPES
  end

  describe "DELETE /destroy" do
    include_examples "deletes item", ITEM_TYPES
  end
end
