# frozen_string_literal: true
require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  let!(:invitation) { create :invitation }

  describe 'GET #new' do
    it 'returns http success' do
      get :new, token: invitation.token
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST #create' do
    it 'register new user' do
      expect do
        post :create, token: invitation.token, registration: { password: 'Secret123', password_confirmation: 'Secret123' }
      end.to change { User.count }.by(1)
    end

    context 'when password is not confirmed' do
      it 'does not register a user' do
        expect do
          post :create, token: invitation.token, registration: { password: 'Secret123', password_confirmation: '' }
        end.not_to change { User.count }

        expect(flash[:alert]).to include 'Password confirmation'
      end
    end
  end
end
