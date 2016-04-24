class RefactorTrackTable < ActiveRecord::Migration
  def change
    remove_column :tracks , :name , :string 
    remove_column :tracks , :artist , :string
  end
end
