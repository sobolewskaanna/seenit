class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :description
      t.string :image_url
      t.string :store_url
      t.integer :user_id
      t.integer :show_id

      t.timestamps null: false
    end
  end
end
