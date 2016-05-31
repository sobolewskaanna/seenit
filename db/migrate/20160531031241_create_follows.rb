class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.integer :user_id
      t.integer :show_id

      t.timestamps null: false
    end
  end
end
