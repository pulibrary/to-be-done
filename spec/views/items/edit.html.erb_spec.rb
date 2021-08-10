# frozen_string_literal: true
require "rails_helper"

RSpec.describe "items/edit.html.erb", type: :view do
  let(:user) { create(:user) }
  before { sign_in user }

  it "has link to destroy item" do
    book = create(:book, user: user)
    assign(:item, book)

    render

    expect(rendered).to have_link "Destroy"
  end
end
