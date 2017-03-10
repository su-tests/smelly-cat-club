# frozen_string_literal: true
FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "user.#{n}@example.com" }
    password 'secret123'
    password_confirmation 'secret123'
    confirmed_at { Time.now }
  end
end
