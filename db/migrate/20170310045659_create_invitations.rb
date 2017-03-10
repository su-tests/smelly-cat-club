class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :issuer_id
      t.string :email
      t.string :token

      t.timestamps null: false
    end

    add_index :invitations, :token, unique: true
  end
end
