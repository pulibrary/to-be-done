# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Item manager", type: :system do
  context "adds item" do
    scenario "of type book" do
      user = create(:user)
      sign_in user
      visit "/"

      click_link "+ Add Book"
      expect(current_path).to eq new_user_book_path(user)

      fill_in "Name", with: "Shadow And Bone"
      fill_in "Author", with: "Leigh Bardugo"
      select "Ready to Start", from: "Status"
      fill_in "Link", with: "https://www.goodreads.com/book/show/10194157-shadow-and-bone"
      fill_in "Notes", with: "A TV show adaptation recently came out on Netflix."
      click_on "Create Book"

      expect(current_path).to eq user_book_path(user, 1)
      expect(page).not_to have_content "New Book"
      expect(page).to have_content "Shadow And Bone"
      expect(page).to have_content "Ready to Start"
    end
  end
end
