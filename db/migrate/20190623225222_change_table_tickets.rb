class ChangeTableTickets < ActiveRecord::Migration[5.2]
  def self.up
    remove_column :tickets, :place_departure
    remove_column :tickets, :place_arrival
    remove_column :tickets, :user_id

    add_column :tickets, :from, :string
    add_column :tickets, :to,   :string
  end

  def self.down
    add_column :tickets, :place_departure, :string
    add_column :tickets, :place_arrival,   :string
    add_column :tickets, :user_id,         :integer

    remove_column :tickets, :from
    remove_column :tickets, :to
  end
end
