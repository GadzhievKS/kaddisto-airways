class RemoveCountryToAirlines < ActiveRecord::Migration[5.2]
  def change
    remove_column :airlines, :country
  end
end
