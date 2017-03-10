# frozen_string_literal: true
require 'rails_helper'

RSpec.feature 'InviteAFriends', type: :feature do
  let(:current_user) { create :user }

  scenario 'user invites his firned and email is sent' do
    sign_in current_user

    visit '/'

    click_link 'Invite Your Friend'

    fill_in 'Email', with: 'my.friend@example.com'
    click_button 'Invite'
  end
end
