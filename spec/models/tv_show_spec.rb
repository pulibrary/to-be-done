# frozen_string_literal: true
require "rails_helper"
require_relative "../support/shared_examples_for_items"

RSpec.describe TvShow, type: :model do
  it_behaves_like "an item"
end
