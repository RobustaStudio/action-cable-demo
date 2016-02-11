class AddUserToTweet < ActiveRecord::Migration[5.0]
  def change
    add_column :tweets, :user_id, :integer, null: false
  end
end
