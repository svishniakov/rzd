class DropCarriageTypeIdSolution < ActiveRecord::Migration[5.0]
  def change
    drop_table :carriage_types
    remove_column :carriages, :carriage_type_id
  end
end
