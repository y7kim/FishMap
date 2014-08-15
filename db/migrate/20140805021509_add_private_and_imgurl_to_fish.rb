class AddPrivateAndImgurlToFish < ActiveRecord::Migration
  def change
  	add_column :fish, :private, :boolean
  	add_column :fish, :imgurl, :string
  	rename_column :fish, :name, :species
  end
end
