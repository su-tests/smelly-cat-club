# frozen_string_literal: true
FactoryGirl.define do
  factory :invitation do
    issuer { build :user }
    sequence(:email) { |n| "invited.user.#{n}@example.com" }
    sequence(:token) { |n| "secret-token-#{n}" }

    trait :pending do
      sent_at { Time.zone.now }
    end

    trait :registered do
      sent_at { Time.zone.now }

      after :create do |invitation|
        create(:user, email: invitation.email)
      end
    end
  end
end
