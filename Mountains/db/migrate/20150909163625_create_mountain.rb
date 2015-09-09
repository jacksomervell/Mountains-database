class CreateMountain < ActiveRecord::Migration
  def change
    create_table :mountains do |t|
      t.string :name
      t.string :photo_url
      t.string :height

      t.timestamps
  end
end
end