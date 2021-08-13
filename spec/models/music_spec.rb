# frozen_string_literal: true
require "rails_helper"

RSpec.describe Music, type: :model do
  it_behaves_like "an item"

  it { is_expected.to validate_presence_of(:artist) }
end
