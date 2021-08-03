# frozen_string_literal: true
require "rails_helper"

RSpec.describe "users/index" do
  it "displays all item types" do
    render

    expect(rendered).to have_content "Books"
    expect(rendered).to have_content "TV Shows"
    expect(rendered).to have_content "Movies"
    expect(rendered).to have_content "Music"
  end

  it "has link to add new item" do
    render

    expect(rendered).to have_link "+ Add Item", href: root_path
  end
end
