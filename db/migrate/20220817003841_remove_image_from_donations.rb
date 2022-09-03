class RemoveImageFromDonations < ActiveRecord::Migration[6.1]
  def change
    remove_column :donations, :image
  end
end
