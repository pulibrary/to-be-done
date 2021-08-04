# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Users", type: :request do
  let(:user) do
    User.create(
      first_name: "Ron",
      last_name: "Weasley",
      email: "ron@weasley.com",
      password: "hermione123",
      password_confirmation: "hermione123"
    )
  end

  describe "GET /show" do
    it "display's user's full name" do
      get user_path(user)

      expect(response.body).to have_content "Ron Weasley"
    end
  end
end
