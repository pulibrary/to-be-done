# frozen_string_literal: true
require "rails_helper"

RSpec.describe "User registers", type: :system do
  scenario "with valid details" do
    visit "/"
    click_link "Sign Up"
    expect(current_path).to eq(new_user_registration_path)

    sign_up "Harry", "Potter", "hp@pottermore.com", "ginny4eva", "ginny4eva"

    expect(current_path).to eq "/"
    expect(page).to have_content "signed up successfully"
    expect(page).to have_content "Harry's tbd"
    expect(User.last.first_name).to eq "Harry"
    expect(User.last.last_name).to eq "Potter"
  end

  context "with invalid details" do
    before { visit new_user_registration_path }

    scenario "like blank fields" do
      expect(page).to have_field("Email", with: "", type: "email")
      expect(find_field("Password", type: "password").value).to be_nil
      expect(find_field("Password confirmation", type: "password").value).to be_nil

      click_button "Sign up"

      expect(page).to have_content "Email can't be blank"
      expect(page).to have_content "Password can't be blank"
      expect(page).to have_content "First name can't be blank"
      expect(page).to have_content "Last name can't be blank"
    end

    scenario "like invalid email" do
      sign_up "Harry", "Potter", "hppottermore.com", "ginny4eva", "ginny4eva"

      expect(page).to have_content "Email is invalid"
    end

    scenario "like incorrect password confirmation" do
      sign_up "Harry", "Potter", "hp@pottermore.com", "ginny4eva", "ginnyeva"

      expect(page).to have_content "Password confirmation doesn't match Password"
    end

    scenario "like too short of a password" do
      sign_up "Harry", "Potter", "hp@pottermore.com", "ginny", "ginny"

      expect(page).to have_content "Password is too short (minimum is 6 characters)"
    end
  end

  private

  def sign_up(first_name, last_name, email, password, password_confirm)
    fill_in "First name", with: first_name
    fill_in "Last name", with: last_name
    fill_in "Email", with: email
    fill_in "Password", with: password
    fill_in "Password confirmation", with: password_confirm
    click_button "Sign up"
  end
end
