class ChangePrivateToIsprivateInFish < ActiveRecord::Migration
  def change
  	rename_column :fish, :private, :isprivate
  end
end
