# frozen_string_literal: true
require "rails_helper"

RSpec.describe "users/show.html.erb", type: :view do
  it "displays user's full name" do
    assign(:user, create(:user))

    render

    expect(rendered).to have_content "Ron Weasley"
  end
end
