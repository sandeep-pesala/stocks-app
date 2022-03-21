class CreateFriendships < ActiveRecord::Migration[5.0]
  def change
    create_table :friendshipss do |t|
      t.references :user, foreign_key: true
      t.references :friend, references: :users, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
