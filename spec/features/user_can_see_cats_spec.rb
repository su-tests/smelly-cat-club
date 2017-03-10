# frozen_string_literal: true
require 'rails_helper'

RSpec.feature 'UserCanSeeCats', type: :feature do
  let(:user) { create :user, password: 'Secret123', password_confirmation: 'Secret123' }

  scenario 'user open site and cant see the cat, but after login he can' do
    visit '/'

    expect(page).not_to have_css 'img.cute-catty-picture'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'Secret123'
    click_button 'Log in'

    expect(page).to have_css 'img.cute-catty-picture'

    click_link 'Log out'

    expect(page).not_to have_css 'img.cute-catty-picture'
  end
end
