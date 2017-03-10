class Invitation < ActiveRecord::Base
  belongs_to :issuer, class_name: 'User', foreign_key: :issuer_id

  validates :token, uniqueness: true
  validates :email, presence: true
end
