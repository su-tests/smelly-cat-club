# frozen_string_literal: true
class Invitation < ActiveRecord::Base
  belongs_to :issuer, class_name: 'User', foreign_key: :issuer_id

  validates :token, uniqueness: true, presence: true
  validates :email, presence: true

  def state
    if User.exists?(email: email)
      'registered'
    else
      'pending'
    end
  end
end
