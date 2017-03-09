# frozen_string_literal: true
require 'rails_helper'

RSpec.describe ClubController, type: :controller do
  describe 'GET #catty' do
    it 'returns http success' do
      get :catty
      expect(response).to have_http_status(:redirect)
    end
  end
end
