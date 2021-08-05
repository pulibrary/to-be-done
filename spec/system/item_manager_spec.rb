# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Item manager", type: :system do
  context "adds item" do
    scenario "of type book" do
      user = create(:user)
      sign_in user
      visit "/"
      expect(page).to have_content "#{user.first_name}'s tbd"

      click_link "+ Add Item"

      expect(current_path).to eq root_path
    end
  end
end
