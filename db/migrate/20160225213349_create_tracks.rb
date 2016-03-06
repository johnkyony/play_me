class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name
      t.string :artist
      t.integer :length
      t.integer :soundcloud_id
      t.string :stream_url

      t.timestamps null: false
    end
  end
end
