# frozen_string_literal: true
# Demo user setup
user = User.find_or_initialize_by email: 'demo@example.com'
user.password = user.password_confirmation = 'Demo123'
user.save!
