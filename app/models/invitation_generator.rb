class InvitationGenerator
  def initialize(issuer:, email:)
    @issuer = issuer
    @email = email
  end

  def generate!
    Invitation.create! issuer: @issuer, email: @email, token: token
  end

  private

  def token
    "#{Time.now.to_f}#{rand}"
  end
end
