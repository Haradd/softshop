class CreateWishlists < ActiveRecord::Migration[5.2]
  def change
    create_table :wishlists do |t|
      t.string :name, null: false
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
