class AddSentAtToInvitations < ActiveRecord::Migration
  def change
    add_column :invitations, :sent_at, :datetime
  end
end
