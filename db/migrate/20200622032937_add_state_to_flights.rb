class AddStateToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :state, :string
  end
end
