# frozen_string_literal: true
require "rails_helper"

RSpec.describe "items/show.html.erb", type: :view do
  let(:user) { create(:user) }
  before { sign_in user }

  it "displays item's details" do
    book = Book.create(attributes_for(:book, user_id: user.id))
    assign(:item, book)

    render

    expect(rendered).to have_content book.name
    expect(rendered).to have_content book.status
  end
end
