require 'rails_helper'

RSpec.describe InvitationDelivery, type: :model do
  it 'should send email to a new user'

  context 'when email has been sent' do

    it 'does not send notifications too ofter'

    context 'when N days passed' do
      it 'should send email again'
    end
  end
end
