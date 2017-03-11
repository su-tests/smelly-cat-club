# frozen_string_literal: true
class InvitationsController < ApplicationController
  def index
    @invitations = Invitation.where(issuer: current_user)
  end

  def new; end

  def create
    invitation_generator = InvitationGenerator.new(issuer: current_user, email: invitation_params[:email])
    invitation = invitation_generator.generate!

    invitation_delivery = InvitationDelivery.new invitation
    invitation_delivery.deliver!

    flash[:info] = "Invitation sent to #{invitation.email}"

    redirect_to invitations_path
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email)
  end
end
