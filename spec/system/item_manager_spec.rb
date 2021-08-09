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

      fill_in "Name", with: "Shadow And Bone"
      fill_in "Author", with: "Leigh Bardugo"
      fill_in "Status", with: "Ready to Start"
      fill_in "Link", with: "https://www.goodreads.com/book/show/10194157-shadow-and-bone"
      fill_in "Notes", with: "A TV show adaptation recently came out on Netflix."
      click_on "Create Item"

      expect(current_path).to eq user_item_path(user, user.items.last)
      expect(page).to have_content "Shadow And Bone"
      expect(page).to have_content "Ready to Start"
    end
  end
end
