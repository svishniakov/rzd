class AddCarriageTypeToCarriage < ActiveRecord::Migration[5.0]
  def change
    add_belongs_to :carriages, :carriage_type
  end
end
