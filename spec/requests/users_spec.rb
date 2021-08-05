# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Users", type: :request do
  describe "GET /show" do
    it "renders show template" do
      user = create(:user)

      get user_path(user)

      expect(response).to render_template :show
    end
  end
end
