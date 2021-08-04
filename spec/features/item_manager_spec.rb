# frozen_string_literal: true
require "rails_helper"

RSpec.feature "Item manager", type: :feature do
  let(:user) do
    User.create(
      first_name: "Ron",
      last_name: "Weasley",
      email: "ron@weasley.com",
      password: "hermione123",
      password_confirmation: "hermione123"
    )
  end

  context "adds item" do
    scenario "of type book" do
      sign_in user
      visit "/"
      expect(page).to have_content "Ron's tbd"

      click_link "+ Add Item"
      expect(current_path).to eq root_path
    end
  end
end
