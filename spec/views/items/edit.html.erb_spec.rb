# frozen_string_literal: true
require "rails_helper"

RSpec.describe "items/edit.html.erb", type: :view do
  let(:user) { create(:user) }
  before { sign_in user }

  it "has link to destroy item" do
    book = Book.create(attributes_for(:book, user_id: user.id))
    assign(:item, book)

    render

    expect(rendered).to have_link "Destroy", href: user_book_path(user, book)
  end
end
