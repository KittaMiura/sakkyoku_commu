class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups do |t|
      t.string :name
      t.text :introduction
      t.integer :owner_id
      # ↓参加条件
      t.string :status
      t.references :user

      t.timestamps
    end
  end
end
