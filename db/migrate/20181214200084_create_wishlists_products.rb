class CreateWishlistsProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :wishlists_products, id: false do |t|
      t.integer :order, limit: 3, default: 0
      t.integer :product_id, :limit => 8
      t.integer :wishlist_id, :limit => 8

      t.timestamps
    end

    add_foreign_key :wishlists_products, :wishlists
    add_foreign_key :wishlists_products, :products


    reversible do |change|
      change.up do
        execute %Q{ ALTER TABLE "wishlists_products" ADD PRIMARY KEY ("wishlist_id", "product_id"); }
      end

      change.down do
        execute %Q{ ALTER TABLE "wishlists_products" DROP CONSTRAINT wishlists_products_pkey; }
      end
    end
  end
end
