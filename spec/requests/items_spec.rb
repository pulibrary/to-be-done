# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Items", type: :request do
  let(:user) { create(:user) }
  let(:item) { create(:item, user: user) }
  before { sign_in user }

  describe "GET /home" do
    it "renders :home template" do
      get root_path

      expect(response).to render_template :home
    end
  end

  describe "GET /index" do
    context "renders :index template for item" do
      it "of type book" do
        get polymorphic_path([user, :books])

        expect(response).to render_template :index
      end
    end
  end

  describe "GET /show" do
    context "renders :show tempalte for item" do
      it "of type book" do
        get user_book_path(user, create(:book, user: user))

        expect(response).to render_template :show
      end
    end
  end

  describe "GET /new" do
    context "renders :new template for item" do
      after do
        expect(response).to render_template :new
        expect(response).to render_template(partial: "_form")
      end

      it "of type book" do
        get new_user_book_path(user)
      end
    end
  end

  describe "POST /create" do
    it "redirects to item's page on successful item creation" do
      post user_books_path(user), params: { item: attributes_for(:book) }

      expect(response).to redirect_to user_book_path(user, user.items.last)
    end

    it "re-renders :new template on unsuccessful item creation" do
      post user_books_path(user), params: { item: attributes_for(:book, status: "") }

      expect(response).to render_template :new
    end
  end

  describe "GET /edit" do
    it "renders :edit template" do
      book = create(:book, user: user)
      get edit_user_book_path(user, book)

      expect(response).to render_template :edit
      expect(response).to render_template(partial: "_form")
    end
  end

  describe "PUT /update" do
    it "redirects to item's page on successful item update" do
      book = create(:book, user: user)
      put user_book_path(user, book), params: { item: attributes_for(:book, status: "In Progress") }

      expect(response).to redirect_to user_book_path(user, user.items.last)
    end

    it "re-renders :edit template on unsuccessful item update" do
      book = create(:book, user: user)
      put user_book_path(user, book), params: { item: attributes_for(:book, status: "") }

      expect(response).to render_template :edit
    end
  end

  describe "DELETE /destroy" do
    context "redirects home on successful deletion" do
      it "of book type" do
        book = create(:book, user: user)
        delete user_book_path(user, book)

        expect(user.items).not_to include book
        expect(response).to redirect_to user_books_path(user)
      end
    end
  end
end
