# frozen_string_literal: true
class InvitationMailer < ApplicationMailer
  def notify_user
    @greeting = 'Hi'

    mail to: 'to@example.org'
  end
end
