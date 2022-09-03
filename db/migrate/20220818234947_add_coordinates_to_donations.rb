class AddCoordinatesToDonations < ActiveRecord::Migration[6.1]
  def change
    add_column :donations, :latitude, :float
    add_column :donations, :longitude, :float
  end
end
