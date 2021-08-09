# frozen_string_literal: true
require "rails_helper"

RSpec.describe "users/show.html.erb", type: :view do
  it "displays user's full name" do
    user = create(:user)
    assign(:user, user)

    render

    expect(rendered).to have_content user.full_name
  end
end
