# frozen_string_literal: true
require "rails_helper"

RSpec.describe "home/index.html.erb", type: :view do
  it "has link to sign up" do
    render
    expect(rendered).to have_link "Sign Up", href: new_user_registration_path
  end

  it "has link to log in" do
    render
    expect(rendered).to have_link "Log In", href: new_user_session_path
  end
end
