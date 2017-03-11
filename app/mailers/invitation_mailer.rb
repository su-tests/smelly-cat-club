# frozen_string_literal: true
class InvitationMailer < ApplicationMailer
  def notify_user(invitation)
    @invitation = invitation
    mail to: invitation.email, subject: "User #{invitation.issuer.email} invited you to SCC"
  end
end
