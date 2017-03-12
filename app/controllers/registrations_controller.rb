# frozen_string_literal: true
class RegistrationsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_invitation

  def new; end

  def create
    @user = User.new user_params
    @user.email = @invitation.email
    @user.confirmed_at = Time.zone.now

    if @user.save
      sign_in @user
      redirect_to root_path
    else
      flash[:alert] = @user.errors.full_messages.join('. ')
      render :new
    end
  end

  private

  def set_invitation
    @invitation = Invitation.find_by token: params[:token]
  end

  def user_params
    params.require(:registration).permit(:password, :password_confirmation)
  end
end
