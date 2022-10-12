class AddFollowersFollowingColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :followers, :integer, :default => 0, :after => :admin 
    add_column :users, :following, :integer, :default => 0, :after => :followers
  end
end
