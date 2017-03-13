require 'rails_helper'

RSpec.feature "RegisterAsANewUsers", type: :feature do
  scenario 'user open site and cant see the cat, but after login he can' do
    visit '/'

    click_link 'Sign up'

    expect(page).to have_css 'h2', text: 'Sign up'

    fill_in 'Email', with: 'foo@example.com'
    fill_in 'Password', with: 'Secret123'
    fill_in 'Password confirmation', with: 'Secret123'

    expect { click_button 'Sign up' }.to change { User.count }.by(1)

    User.last.update_columns confirmed_at: Time.now

    visit '/'

    fill_in 'Email', with: 'foo@example.com'
    fill_in 'Password', with: 'Secret123'
    click_button 'Log in'
    
    expect(page).to have_css 'img.cute-catty-picture'
  end
end
