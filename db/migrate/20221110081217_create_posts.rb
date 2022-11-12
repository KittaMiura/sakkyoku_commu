class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|

      t.string :title, null: false
      t.text :introduction, null: false
      t.integer :user_id
      t.integer :post_tag_id
      t.boolean :status, default: true

      t.timestamps
    end
  end
end
