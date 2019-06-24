class ChangeAirlinesIdToAircrafts < ActiveRecord::Migration[5.2]
  def change
    rename_column :aircrafts, :airlines_id, :airline_id
  end
end
