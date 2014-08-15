class ChangeImageUidToAttachmentInFish < ActiveRecord::Migration
  def change
  	rename_column :fish, :image_uid, :attachment
  end
end
