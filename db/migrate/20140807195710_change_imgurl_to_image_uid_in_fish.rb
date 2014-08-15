class ChangeImgurlToImageUidInFish < ActiveRecord::Migration
  def change
  	rename_column :fish, :imgurl, :image_uid
  end
end
