# frozen_string_literal: true
class InvitationDelivery
  THROTTLE_DAYS = 1

  def initialize(invitation)
    @invitation = invitation
  end

  def deliver!
    return [false, ['User is already registered']] if already_registered?
    return [false, ["Can't send invitation until #{I18n.localize next_allowed_time}"]] if been_sent_recently?
    @invitation.update_attributes sent_at: Time.zone.now
    InvitationMailer.notify_user(@invitation).deliver_later

    [true, []]
  end

  private

  def next_allowed_time
    return Time.zone.now if @invitation.sent_at.blank?

    @invitation.sent_at + THROTTLE_DAYS.days
  end

  def been_sent_recently?
    return false if @invitation.sent_at.blank?
    @invitation.sent_at > THROTTLE_DAYS.days.ago
  end

  def already_registered?
    User.exists? email: @invitation.email
  end
end
