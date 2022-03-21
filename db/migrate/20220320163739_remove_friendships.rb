class RemoveFriendships < ActiveRecord::Migration[5.0]
  def change
    drop_table :friendships 
    drop_table :friendshipss
  end
end
