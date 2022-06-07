class AddNameToVehicles < ActiveRecord::Migration[6.1]
  def change
    add_column :vehicles, :name, :string
  end
end
