# frozen_string_literal: true
require 'rails_helper'

RSpec.describe 'IndexPage', type: :request do
  describe 'GET /' do
    it 'works!' do
      get '/'
      expect(response).to be_redirect
    end
  end
end
