# frozen_string_literal: true
FactoryBot.define do
  factory :user do
    first_name { "Ron" }
    last_name { "Weasley" }
    sequence(:email) { |n| "#{n}@weasley.com" }
    password { "hermione123" }
    password_confirmation { "hermione123" }

    factory :user_with_items do
      after(:create) do |user|
        [:book, :tv_show, :movie, :music].each do |item_type|
          ["Ready to Start", "In Progress", "Paused", "Finished"].each do |status|
            create(item_type, user: user, status: status)
          end
        end
        user.reload
      end
    end
  end
end
