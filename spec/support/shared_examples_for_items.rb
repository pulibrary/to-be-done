# frozen_string_literal: true
RSpec.shared_examples "an item" do
  it "has the type attribute" do
    expect(subject).to have_attribute :type
  end

  it "is an instance of the described class" do
    expect(subject).to be_a_kind_of described_class
  end

  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }

    it { is_expected.to validate_presence_of(:status) }
  end

  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end
end
