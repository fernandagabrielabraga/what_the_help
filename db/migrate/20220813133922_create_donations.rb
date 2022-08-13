class CreateDonations < ActiveRecord::Migration[6.1]
  def change
    create_table :donations do |t|
      t.string :donation_name
      t.string :description
      t.text :image
      t.text :location
      t.boolean :is_donation
      t.integer :quantity
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
