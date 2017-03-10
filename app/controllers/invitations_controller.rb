class InvitationsController < ApplicationController
  def index
    @invitations = Invitation.where(issuer: current_user)
  end

  def new
    @invitations = Invitation.new(issuer: current_user)
  end

  def create
    invitation_generator = InvitationGenerator.new(issuer: current_user, email: invitation_params[:email])
    invitation = invitation_generator.generate!

    flash[:info] = "Invitation sent to #{invitation.email}"

    redirect_to invitations_path
  end

  private

  def invitation_params
    params.require(:invitation).permit(:email)
  end
end
