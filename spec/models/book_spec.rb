# frozen_string_literal: true
require "rails_helper"

RSpec.describe Book, type: :model do
  it_behaves_like "an item"

  it { is_expected.to validate_presence_of(:author) }
end
