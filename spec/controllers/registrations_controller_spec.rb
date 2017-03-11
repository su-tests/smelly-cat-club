# frozen_string_literal: true
require 'rails_helper'

RSpec.describe RegistrationsController, type: :controller do
  let(:invitation) { create :invitation }

  describe 'GET #new' do
    it 'returns http success' do
      get :new, token: invitation.token
      expect(response).to have_http_status(:success)
    end
  end
end
