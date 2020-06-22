class CreateTableTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.references :flight
      t.references :user
      t.integer  :price

      t.timestamps
    end
  end
end
