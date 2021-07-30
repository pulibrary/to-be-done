require 'rails_helper'

RSpec.feature "User registers", :type => :feature do
  scenario "with valid details" do
    visit "/"
    click_link "Sign Up"
    expect(current_path).to eq(new_user_registration_path)

    fill_in "First name", with: "Harry"
    fill_in "Last name", with: "Potter"
    fill_in "Email", with: "hp@pottermore.com"
    fill_in "Password", with: "ginny4eva"
    fill_in "Password confirmation", with: "ginny4eva"
    click_button "Sign up"

    expect(current_path).to eq "/"
    expect(page).to have_content "signed up successfully"
    expect(User.last.first_name).to eq "Harry"
    expect(User.last.last_name).to eq "Potter"
  end

  context "with invalid details" do
    before(:each) do
      visit new_user_registration_path
    end

    scenario "blank fields" do
      expect(page).to have_field("Email", with: "", type: "email")
      expect(find_field("Password", type: "password").value).to be_nil
      expect(find_field("Password confirmation", type: "password").value).to be_nil

      click_button "Sign up"

      expect(page).to have_content "Email can't be blank"
      expect(page).to have_content "Password can't be blank"
      expect(page).to have_content "First name can't be blank"
      expect(page).to have_content "Last name can't be blank"
    end

    scenario "invalid email" do
      fill_in "First name", with: "Harry"
      fill_in "Last name", with: "Potter"
      fill_in "Email", with: "hppottermore.com"
      fill_in "Password", with: "ginny4eva"
      fill_in "Password confirmation", with: "ginny4eva"
      click_button "Sign up"

      expect(page).to have_content "Email is invalid"
    end

    scenario "incorrect password confirmation" do
      fill_in "First name", with: "Harry"
      fill_in "Last name", with: "Potter"
      fill_in "Email", with: "hp@pottermore.com"
      fill_in "Password", with: "ginny4eva"
      fill_in "Password confirmation", with: "ginnyeva"
      click_button "Sign up"

      expect(page).to have_content "Password confirmation doesn't match Password"
    end

    scenario "too short password" do
      fill_in "First name", with: "Harry"
      fill_in "Last name", with: "Potter"
      fill_in "Email", with: "hp@pottermore.com"
      fill_in "Password", with: "ginny"
      fill_in "Password confirmation", with: "ginny"
      click_button "Sign up"

      expect(page).to have_content "Password is too short (minimum is 6 characters)"
    end
  end
end
