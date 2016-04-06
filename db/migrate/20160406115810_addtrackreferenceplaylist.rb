class Addtrackreferenceplaylist < ActiveRecord::Migration
  def change
    add_reference :playlists , :track , index: true , foreign_key: true
  end
end
