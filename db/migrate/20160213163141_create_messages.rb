class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :content, null: false
      t.integer :sender_id, null: false
      t.integer :recipient_id

      t.timestamps
    end
  end
end
