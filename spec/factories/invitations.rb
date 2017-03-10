# frozen_string_literal: true
FactoryGirl.define do
  factory :invitation do
    issuer { build :user }
    sequence(:email) { |n| "invited.user.#{n}@example.com" }
    sequence(:token) { |n| "secret-token-#{n}" }
  end
end
