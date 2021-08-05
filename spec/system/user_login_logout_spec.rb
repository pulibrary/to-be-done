# frozen_string_literal: true
require "rails_helper"

RSpec.describe "User logs in", type: :system do
  let(:returning_user) { create(:user) }

  context "with valid details" do
    scenario "belonging to registered user" do
      visit "/"
      click_link "Log In"
      expect(current_path).to eq(new_user_session_path)

      log_in returning_user.email, returning_user.password
      expect(page).to have_content "#{returning_user.first_name}'s tbd"
      expect(current_path).to eq(root_path)

      click_link "Logout"
      expect(page).to have_content("Signed out successfully")
      expect(current_path).to eq(root_path)
    end

    scenario "belonging to unregistered user" do
      visit new_user_session_path

      log_in "harry@pottermore.com", "ginny4eva"

      expect(page).to have_content("Invalid Email or password")
      expect(current_path).to eq(new_user_session_path)
    end
  end

  context "with invalid details" do
    before do
      visit new_user_session_path
    end

    scenario "like wrong email" do
      log_in "ronweasley.com", returning_user.password

      expect(page).to have_content("Invalid Email or password")
      expect(current_path).to eq(new_user_session_path)
    end

    scenario "like wrong password" do
      log_in returning_user.email, "Hermione12"

      expect(page).to have_content("Invalid Email or password")
      expect(current_path).to eq(new_user_session_path)
    end
  end

  private

  def log_in(email, password)
    fill_in "Email", with: email
    fill_in "Password", with: password
    click_button "Log in"
  end
end
