# frozen_string_literal: true
require "rails_helper"

RSpec.describe "items/show.html.erb", type: :view do
  it "displays item's details" do
    item = create(:item)
    assign(:item, item)

    render

    expect(rendered).to have_content item.name
    expect(rendered).to have_content item.status
  end
end
