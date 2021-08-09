# frozen_string_literal: true
FactoryBot.define do
  factory :item do
    name { "Shadow and Bone" }
    status { "Ready to Start" }
    association :user

    factory :book do
      author { "Leigh Bardugo" }
      link { "https://www.goodreads.com/book/show/10194157-shadow-and-bone" }
      notes { "A TV show adaptation recently came out on Netflix." }
    end
  end
end
