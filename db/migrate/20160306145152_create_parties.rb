class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name
      t.string :password
      t.string :location
      t.datetime :occurence
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
