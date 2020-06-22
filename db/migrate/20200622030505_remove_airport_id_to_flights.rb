class RemoveAirportIdToFlights < ActiveRecord::Migration[5.2]
  def up
    remove_column :flights, :airport_id
  end

  def down
    add_column :flights, :airport_id, :integer
  end
end
