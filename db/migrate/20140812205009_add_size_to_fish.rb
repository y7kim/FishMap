class AddSizeToFish < ActiveRecord::Migration
  def change
  	add_column :fish, :size, :integer
  end
end
