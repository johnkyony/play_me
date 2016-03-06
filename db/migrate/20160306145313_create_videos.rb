class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.references :party, index: true, foreign_key: true
      t.string :link
      t.string :uid
      t.string :title
      t.integer :voteup
      t.integer :votedown

      t.timestamps null: false
    end
  end
end
