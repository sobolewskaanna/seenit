class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :title
      t.string :image_url
      t.integer :tvmaze_id

      t.timestamps null: false
    end
  end
end
