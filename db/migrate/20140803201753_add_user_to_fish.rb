class AddUserToFish < ActiveRecord::Migration
  def change
    add_column :fish, :user_id, :integer
  end
end
