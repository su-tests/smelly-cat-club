# frozen_string_literal: true
require 'rails_helper'

RSpec.describe InvitationGenerator, type: :model do
  let(:invitation_generator) { InvitationGenerator.new(issuer: issuer, email: email) }
  let(:issuer) { create :user }
  let(:email) { 'new-user@example.com' }

  describe '.generate' do
    it 'should generate an invitation' do
      expect do
        invitation_generator.generate!
      end.to change { Invitation.where(issuer_id: issuer.id).count }.by(1)
    end

    describe 'invitation' do
      subject do
        invitation, _ = invitation_generator.generate!

        invitation
      end

      its(:issuer) { is_expected.to eq issuer }
      its(:email) { is_expected.to eq email }
      its(:token) { is_expected.to be_present }
    end

    context 'when invitation is already generated' do
      before do
        invitation_generator.generate!
      end

      it 'should not generate a duplicate' do
        expect do
          invitation_generator.generate!
        end.not_to change { Invitation.count }
      end
    end
  end
end
