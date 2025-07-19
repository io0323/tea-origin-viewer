class CreateTeaOrigins < ActiveRecord::Migration[8.0]
  def change
    create_table :tea_origins do |t|
      t.string :name
      t.string :location_name
      t.float :latitude
      t.float :longitude
      t.string :lot_id
      t.date :harvested_on
      t.text :notes

      t.timestamps
    end
  end
end
