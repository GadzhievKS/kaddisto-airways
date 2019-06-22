class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.integer  :price
      t.datetime :time
      t.string   :place_departure
      t.string   :place_arrival
      t.integer  :user_id
      t.integer  :airport_id
      t.integer  :aircraft_id

      t.timestamps
    end
  end
end
