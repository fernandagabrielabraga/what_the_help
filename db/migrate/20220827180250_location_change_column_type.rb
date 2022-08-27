class LocationChangeColumnType < ActiveRecord::Migration[6.1]
  def change
    change_column :donations, :location, :string
  end
end
