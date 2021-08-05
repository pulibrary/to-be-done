# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Item manager", type: :system do
  context "adds item" do
    scenario "of type book" do
      user = create(:user)
      sign_in user
      visit "/"

      click_link "+ Add Item"

      expect(current_path).to eq new_user_item_path(user)
    end
  end
end
