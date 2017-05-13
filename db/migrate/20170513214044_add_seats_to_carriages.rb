class AddSeatsToCarriages < ActiveRecord::Migration[5.0]
  def change
    change_table :carriages do |t|
      t.integer :top_seats
      t.integer :bottom_seats
      t.integer :side_top_seats
      t.integer :side_bottom_seats
      t.integer :sitting_seats
    end
  end
end
