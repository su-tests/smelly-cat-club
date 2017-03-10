require 'rails_helper'

RSpec.describe InvitationDelivery, type: :model do
  let(:invitation_delivery) { InvitationDelivery.new invitation }
  let(:invitation) { create :invitation }

  it 'should send email to a new user' do
    expect do
      invitation_delivery.deliver!
    end.to change{ InvitationMailer.deliveries.count }.by(1)
  end

  context 'when email has been sent' do

    it 'does not send notifications too ofter'

    context 'when N days passed' do
      it 'should send email again'
    end
  end
end
