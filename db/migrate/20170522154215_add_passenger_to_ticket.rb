class AddPassengerToTicket < ActiveRecord::Migration[5.0]
  def change
    add_column :tickets, :passenger, :string
  end
end
