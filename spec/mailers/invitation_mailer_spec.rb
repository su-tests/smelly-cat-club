# frozen_string_literal: true
require 'rails_helper'

RSpec.describe InvitationMailer, type: :mailer do
  describe 'notify_user' do
    let(:mail) { InvitationMailer.notify_user(invitation) }
    let(:invitation) { create :invitation, email: 'new.user@example.com' }

    it 'renders the headers' do
      expect(mail.subject).to eq("User #{invitation.issuer.email} invited you to SCC")
      expect(mail.to).to eq(['new.user@example.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match('Smelly Cat Club Invitation')
      expect(mail.body.encoded).to match(invitation.token)
    end
  end
end
