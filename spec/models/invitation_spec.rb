# frozen_string_literal: true
require 'rails_helper'

RSpec.describe Invitation, type: :model do
  let(:invitation) { build :invitation }

  describe '.state' do
    subject { invitation.state }

    it { is_expected.to eq 'pending' }

    context 'when user registered' do
      before { create(:user, email: invitation.email) }
      it { is_expected.to eq 'registered' }
    end
  end
end
