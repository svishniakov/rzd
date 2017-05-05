class AddRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :routes do |t|
      t.string :number

      t.timestamps
    end
  end
end
