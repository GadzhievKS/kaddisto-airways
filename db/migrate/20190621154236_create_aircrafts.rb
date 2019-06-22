class CreateAircrafts < ActiveRecord::Migration[5.2]
  def change
    create_table :aircrafts do |t|
      t.string  :name
      t.string  :seat_counts
      t.integer :airlines_id

      t.timestamps
    end
  end
end
