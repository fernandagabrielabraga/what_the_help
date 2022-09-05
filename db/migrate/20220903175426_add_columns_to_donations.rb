class AddColumnsToDonations < ActiveRecord::Migration[6.1]
  def change
    add_column :donations, :available, :boolean, default: true
    add_column :donations, :donation_received, :integer, default: 0
  end
end
