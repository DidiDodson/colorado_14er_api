class CreateFourteeners < ActiveRecord::Migration[5.2]
  def change
    create_table :fourteeners do |t|
      t.string :english_name
      t.string :arapahoe_name
      t.string :arapahoe_translation
      t.string :ute_name
      t.string :ute_translation
      t.integer :elevation
      t.string :range
      t.string :county
      t.string :nearby_towns
      t.string :hiking_routes
      t.string :climate
      t.string :geology
      t.string :first_ascent
      t.string :history
      t.string :resources
      t.string :image
      t.string :map

      t.timestamps
    end
  end
end
