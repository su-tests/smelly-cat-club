# frozen_string_literal: true
class InvitationsController < ApplicationController
  before_action :set_invitation, only: :resend

  def index
    @invitations = Invitation.where(issuer: current_user).order('created_at DESC')
  end

  def new; end

  def create
    invitation_generator = InvitationGenerator.new(issuer: current_user, email: invitation_params[:email])
    invitation = invitation_generator.generate!

    invitation_delivery = InvitationDelivery.new invitation
    invitation_delivery.deliver!

    flash[:notice] = "Invitation sent to #{invitation.email}"

    redirect_to invitations_path
  end

  def resend
    invitation_delivery = InvitationDelivery.new @invitation
    _, errors = invitation_delivery.deliver!

    if errors.blank?
      flash[:notice] = "Invitation sent to #{@invitation.email}"
    else
      flash[:alert] = errors.join('. ')
    end

    redirect_to invitations_path
  end

  private

  def set_invitation
    @invitation = Invitation.where(issuer: current_user).find params[:id]
  end

  def invitation_params
    params.require(:invitation).permit(:email)
  end
end
