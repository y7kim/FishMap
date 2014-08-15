class CreateFish < ActiveRecord::Migration
  def change
    create_table :fish do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.datetime :caught
      t.string :description

      t.timestamps
    end
  end
end
