class ChangeIsDonationDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :donations, :is_donation, true
  end
end
