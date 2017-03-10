require 'rails_helper'

RSpec.describe InvitationsController, type: :controller do
  let(:current_user) { create :user }
  before { sign_in current_user }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "should create an invitation" do
      expect do
        post :create, invitation: { email: 'foo@example.com'}
      end.to change { Invitation.where(issuer: current_user).count }.by(1)

      expect(response).to have_http_status(:redirect)
    end
  end

end
