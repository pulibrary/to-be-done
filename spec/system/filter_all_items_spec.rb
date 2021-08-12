# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Filter all items", type: :system do
  include_examples "filter by status", "/"
end
