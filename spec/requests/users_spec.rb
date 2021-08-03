# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Users", type: :request do
  # let(:user) { User.create(
  #   first_name: "Ron",
  #   last_name: "Weasley",
  #   email: "ron@weasley.com",
  #   password: "hermione123",
  #   password_confirmation: "hermione123"
  # )}

  describe "GET /index" do
    it "returns http success" do
      get "/"

      expect(response).to have_http_status :success
    end
  end
end
