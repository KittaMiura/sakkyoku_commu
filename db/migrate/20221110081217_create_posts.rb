class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.string :title, null: false
      t.integer :user_id
      t.integer :post_tag_id
      t.boolean :status, default: true
      t.boolean :is_ban, default: false

      t.timestamps
    end
  end
end
