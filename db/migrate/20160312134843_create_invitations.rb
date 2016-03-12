class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.references :party, index: true, foreign_key: true
      t.references :sender, references: :users, index: true, foreign_key: true
      t.references :receiver, references: :users,  index: true, foreign_key: true
      t.integer :status, default: 0

      t.timestamps null: false
    end
  end
end
