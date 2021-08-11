# frozen_string_literal: true
module ItemsHelper
  # returns plural form of item type
  def format_type(type)
    case type
    when "TvShow"
      "TV Shows"
    when "Music"
      "Music"
    else
      type.pluralize
    end
  end
end
