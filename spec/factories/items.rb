# frozen_string_literal: true
FactoryBot.define do
  factory :item do
    name { "Shadow and Bone" }
    status { "Ready to Start" }
    association :user
    notes { "" }

    factory :book, class: "Book" do
      author { "Leigh Bardugo" }
      link { "https://www.goodreads.com/book/show/10194157-shadow-and-bone" }
      notes { "A TV show adaptation recently came out on Netflix." }
    end

    factory :tv_show, class: "TvShow" do
      status { "Finished" }
      rating { 5 }
      notes { "Adapted from the book of the same name." }
    end

    factory :movie, class: "Movie" do
      name { "Howl's Moving Castle" }
      status { "Paused" }
    end

    factory :music, class: "Music" do
      name { "In The Heights Soundtrack" }
      status { "In Progress" }
      artist { "Various" }
    end
  end
end
