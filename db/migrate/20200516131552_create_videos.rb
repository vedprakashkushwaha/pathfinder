class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :title
      t.string :link
      t.string :standard
      t.string :description

      t.timestamps null: false
    end
  end
end
