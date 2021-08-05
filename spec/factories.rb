# frozen_string_literal: true
FactoryBot.define do
  factory :user do
    first_name { "Ron" }
    last_name { "Weasley" }
    email { "ron@weasley.com" }
    password { "hermione123" }
    password_confirmation { "hermione123" }
  end
end
