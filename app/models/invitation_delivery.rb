# frozen_string_literal: true
class InvitationDelivery
  THROTTLE_DAYS = 1

  def initialize(invitation)
    @invitation = invitation
  end

  def deliver!
    return if been_sent_recently?
    @invitation.update_attributes sent_at: Time.zone.now
    InvitationMailer.notify_user(@invitation).deliver_later
  end

  private

  def been_sent_recently?
    return false if @invitation.sent_at.blank?
    @invitation.sent_at > THROTTLE_DAYS.days.ago
  end
end
