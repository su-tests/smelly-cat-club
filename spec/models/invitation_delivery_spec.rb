# frozen_string_literal: true
require 'rails_helper'

RSpec.describe InvitationDelivery, type: :model do
  let(:invitation_delivery) { InvitationDelivery.new invitation }
  let(:invitation) { create :invitation }

  it 'should send email to a new user' do
    expect do
      invitation_delivery.deliver!
    end.to change { InvitationMailer.deliveries.count }.by(1)
  end

  context 'when email has been sent' do
    let(:first_notification_sent_at) { Time.zone.now }

    before do
      Timecop.travel first_notification_sent_at
      invitation_delivery.deliver!
    end

    after { Timecop.return }

    it 'does not send notifications too ofter' do
      Timecop.travel first_notification_sent_at + 12.hours

      expect do
        invitation_delivery.deliver!
      end.not_to change { InvitationMailer.deliveries.count }
    end

    context 'when 24 hours passed' do
      before do
        Timecop.travel first_notification_sent_at + 25.hours
      end

      it 'should send email again' do
        expect do
          invitation_delivery.deliver!
        end.to change { InvitationMailer.deliveries.count }.by(1)
      end
    end
  end
end
