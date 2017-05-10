class AddTopandBottomSeatsToCarriageType < ActiveRecord::Migration[5.0]
  def change
    add_column :carriage_types, :top_seats, :integer
    add_column :carriage_types, :bottom_seats, :integer
    remove_column :carriage_types, :seats
  end
end
