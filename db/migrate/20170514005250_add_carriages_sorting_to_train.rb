class AddCarriagesSortingToTrain < ActiveRecord::Migration[5.0]
  def change
    add_column :trains, :carriages_sorting, :boolean, default: false
  end
end
