# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ClubController, type: :controller do
  describe 'GET #catty' do
    it 'cant be accessed by guests' do
      get :catty
      expect(response).to have_http_status(:redirect)
    end

    context 'when user is signed in' do
      before { sign_in create(:user) }

      it 'cant be accessed by guests' do
        get :catty
        expect(response).to have_http_status(:success)
      end
    end
  end
end
