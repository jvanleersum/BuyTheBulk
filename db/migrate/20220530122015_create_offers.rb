class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    create_table :offers do |t|
      t.string :name
      t.float :initial_price
      t.float :target_price
      t.integer :target_amount
      t.string :supplier_offer_url
      t.string :offers
      t.text :description
      t.string :category
      t.datetime :deadline
      t.references :user, null: false, foreign_key: true
      t.references :supplier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
