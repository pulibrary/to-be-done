# frozen_string_literal: true
require "rails_helper"

# Specs in this file have access to a helper object that includes
# the HomeHelper. For example:
#
# describe HomeHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ItemsHelper, type: :helper do
  describe "#format_type" do
    it "returns plural form of singular types" do
      expect(format_type("Book")).to eq "Books"
      expect(format_type("Movie")).to eq "Movies"
    end

    it "returns singular form of mass noun type" do
      expect(format_type("Music")).to eq "Music"
    end

    it "returns plural form of multi-word type" do
      expect(format_type("TvShow")).to eq "TV Shows"
    end
  end
end
