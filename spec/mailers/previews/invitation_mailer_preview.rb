# frozen_string_literal: true
# Preview all emails at http://localhost:3000/rails/mailers/invitation_mailer
class InvitationMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/invitation_mailer/notify_user
  def notify_user
    InvitationMailer.notify_user
  end
end
