class DescriptionChangeColumnType < ActiveRecord::Migration[6.1]
  def change
    change_column :donations, :description, :text
  end
end
