class AddNullConstrantToFriendship < ActiveRecord::Migration[6.1]
  def change
    change_column_null :friendships, :following_id, :references, null: false
    change_column_null :friendships, :followed_id, :references, null: false
  end
end
