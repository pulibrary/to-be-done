# frozen_string_literal: true
class Book < Item
  validates :author, presence: true
end
