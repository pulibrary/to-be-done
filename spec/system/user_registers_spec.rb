# frozen_string_literal: true
require "rails_helper"

RSpec.describe "User registers", type: :system do
  scenario "with valid details" do
    visit "/"
    click_link "Sign Up"
    expect(current_path).to eq(new_user_registration_path)

    user = build(:user)
    sign_up user

    expect(current_path).to eq "/"
    expect(page).to have_content "signed up successfully"
    expect(page).to have_content "#{user.first_name}'s tbd"
    expect(User.last.first_name).to eq user.first_name
    expect(User.last.last_name).to eq user.last_name
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
      sign_up build(:user, email: "hppottermore.com")

      expect(page).to have_content "Email is invalid"
    end

    scenario "like incorrect password confirmation" do
      sign_up build(:user, password_confirmation: "ginnyeva")

      expect(page).to have_content "Password confirmation doesn't match Password"
    end

    scenario "like too short of a password" do
      sign_up build(:user, password: "ginny", password_confirmation: "ginny")

      expect(page).to have_content "Password is too short (minimum is 6 characters)"
    end
  end

  private

  def sign_up(user)
    fill_in "First name", with: user.first_name
    fill_in "Last name", with: user.last_name
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    fill_in "Password confirmation", with: user.password_confirmation
    click_button "Sign up"
  end
end
