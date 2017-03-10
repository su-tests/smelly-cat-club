# frozen_string_literal: true
require 'digest'

class InvitationGenerator
  def initialize(issuer:, email:)
    @issuer = issuer
    @email = email
  end

  def generate!
    invitation = Invitation.find_or_initialize_by token: token

    invitation.issuer = @issuer
    invitation.email = @email

    invitation.save!

    invitation
  end

  private

  def token
    Digest::SHA256.hexdigest(
      [Rails.application.secrets[:secret_key_base], @email].join
    )
  end
end
