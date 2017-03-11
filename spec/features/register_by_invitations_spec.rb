require 'rails_helper'

RSpec.feature "RegisterByInvitations", type: :feature do
  let(:issuer) { create :user, email: 'old.user@example.com' }
  let(:invitation) { create :invitation, issuer: issuer }

  scenario 'unregistered user gets an invitations, registers and can see the catty' do
    invitation_delivery = InvitationDelivery.new invitation
    invitation_delivery.deliver!

    mail_body = InvitationMailer.deliveries.last.encoded
    expect(mail_body).to include 'User old.user@example.com invited you'
    invitation_url = Nokogiri::HTML(mail_body).css('.invitation-link').attribute('href')

    expect(invitation_url).to be_present

    visit invitation_url

    expect(page).to have_content 'Register by invitation'

    fill_in 'Password', with: 'Secret123'
    fill_in 'Password confirmation', with: 'Secret123'
    click_button 'Sign up'

    expect(page).to have_css 'img.cute-catty-picture'
  end
end
