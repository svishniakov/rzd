class ChangeTrainsCarriageSorting < ActiveRecord::Migration[5.0]
  def change
    rename_column :trains, :carriages_sorting, :sort_from_head
  end
end
