class RenameTableTicketsToFlights < ActiveRecord::Migration[5.2]
  def change
    rename_table :tickets, :flights
  end
end
