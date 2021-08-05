# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Users", type: :request do
  describe "GET /show" do
    it "display's user's full name" do
      user = create(:user)
      get user_path(user)

      expect(response.body).to have_content user.full_name
    end
  end
end
