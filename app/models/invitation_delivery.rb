# frozen_string_literal: true
class InvitationDelivery
  def initialize(invitation)
    @invitation = invitation
  end

  def deliver!
    InvitationMailer.notify_user.deliver_later
  end
end
