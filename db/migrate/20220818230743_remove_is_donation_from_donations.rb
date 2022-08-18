class RemoveIsDonationFromDonations < ActiveRecord::Migration[6.1]
  def change
    remove_column :donations, :is_donation
  end
end
