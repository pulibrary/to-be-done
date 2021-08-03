# frozen_string_literal: true
require "rails_helper"

RSpec.describe User, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:first_name) }

    it { is_expected.to validate_presence_of(:last_name) }
  end

  describe "associations" do
    it { is_expected.to have_many(:items) }
  end

  describe "#full_name" do
    it "returns first and last name" do
      user = described_class.new(first_name: "Monty", last_name: "Python")
      expect(user.full_name).to eq "Monty Python"
    end
  end
end
