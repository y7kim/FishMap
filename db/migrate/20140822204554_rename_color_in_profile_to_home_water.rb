class RenameColorInProfileToHomeWater < ActiveRecord::Migration
  def change
  	rename_column :profiles, :color, :homewater
  end
end
