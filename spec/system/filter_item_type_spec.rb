# frozen_string_literal: true
require "rails_helper"

RSpec.describe "Filter item type", type: :system do
  ["/users/1/books", "/users/1/tv_shows", "/users/1/movies", "/users/1/music"].each do |url|
    include_examples "filter by status", url
  end
end
