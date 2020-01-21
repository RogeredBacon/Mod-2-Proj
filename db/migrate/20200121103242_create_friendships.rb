class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.references :user
      t.references :friend_user
      t.boolean :confirmed?

      t.timestamps
    end
  end
end
