class CreateCarriageTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :carriage_types do |t|
      t.string :name
      t.integer :seats

      t.timestamps
    end
  end
end
