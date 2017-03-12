# frozen_string_literal: true
require 'rails_helper'

RSpec.describe InvitationsController, type: :controller do
  let(:current_user) { create :user }
  before { sign_in current_user }

  describe 'GET #index' do
    render_views
    let!(:invitation_new) { create :invitation, issuer: current_user }
    let!(:invitation_pending) { create :invitation, :pending, issuer: current_user }
    let!(:invitation_registered) { create :invitation, :registered, issuer: current_user }

    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it 'returns http success' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'should create an invitation' do
      expect do
        post :create, invitation: { email: 'foo@example.com' }
      end.to change { Invitation.where(issuer: current_user).count }.by(1)
    end

    it 'should send an invitation' do
      expect do
        post :create, invitation: { email: 'foo@example.com' }
      end.to change { InvitationMailer.deliveries.count }.by(1)
    end

    it 'should not raise error when email is empty' do
      expect do
        post :create, invitation: { email: '' }
      end.not_to raise_error
    end
  end

  describe 'POST resend' do
    context 'when last sent_at is long time ago' do
      let(:invitation) { create :invitation, issuer: current_user, sent_at: 2.days.ago }

      it 'should send mail' do
        expect do
          post :resend, id: invitation.id
        end.to change { InvitationMailer.deliveries.count }.by(1)

        expect(flash[:notice]).to include 'Invitation sent'
      end
    end

    context 'when sent recently' do
      let(:invitation) { create :invitation, issuer: current_user, sent_at: 2.hours.ago }

      it 'should not send mail' do
        expect do
          post :resend, id: invitation.id
        end.not_to change { InvitationMailer.deliveries.count }

        expect(flash[:alert]).to include "Can't send invitation"
      end
    end

    context 'when invitation owned by another user' do
      let(:invitation) { create :invitation, issuer: create(:user) }

      it 'should render not found' do
        post :resend, id: invitation.id
        expect(response).to have_http_status(:not_found)
      end
    end
  end
end
