class RegistrationsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @invitation = Invitation.find_by token: params[:token]
  end

  def create
    @invitation = Invitation.find_by token: params[:token]

    @user = User.new user_params
    @user.email = @invitation.email
    @user.confirmed_at = Time.now

    if @user.save
      sign_in @user
      redirect_to root_path
    else
      flash[:error] = @user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:registration).permit(:password, :password_confirmation)
  end
end
