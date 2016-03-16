class DropPartyFromVideos < ActiveRecord::Migration
  def change
    remove_column :videos , :party_id, :integer
  end
end
