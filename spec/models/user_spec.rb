require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  describe "associations" do
    pending "should have many items"
  end

  describe "#full_name" do
    it "returns first and last name" do
      user = User.new(first_name: "Monty", last_name: "Python")
      expect(user.full_name).to eq "Monty Python"
    end
  end
end
