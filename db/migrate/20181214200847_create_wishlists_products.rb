class CreateWishlistsProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :wishlists_products do |t|
      t.references :product, foreign_key: true, index: true
      t.references :wishlist, foreign_key: true, index: true

      t.timestamps
    end

    add_index :wishlists_products, [:product_id, :wishlist_id], unique: true
  end
end
