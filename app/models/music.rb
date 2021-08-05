# frozen_string_literal: true
class Music < Item
  validates :artist, presence: true
end
