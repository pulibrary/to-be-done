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

    it {
      is_expected.to validate_inclusion_of(:status)
        .in_array(["Ready to Start", "In Progress", "Paused", "Finished"])
    }
  end

  describe "associations" do
    it { is_expected.to belong_to(:user) }
  end

  describe "#finished?" do
    it "returns false if item status is not finished" do
      item = described_class.new(attributes_for(:item))
      expect(item.finished?).to eq false
    end

    it "returns true if item status is finished" do
      item = described_class.new(attributes_for(:item, status: "Finished"))
      expect(item.finished?).to eq true
    end
  end
end
