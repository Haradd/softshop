class CreateOrdersProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :orders_products, id: false do |t|
      t.integer :amount, null: false, default: 1
      t.decimal :price, precision: 15, scale: 2, null: false
      t.bigint :order_id
      t.bigint :product_id

      t.timestamps
    end

    add_foreign_key :orders_products, :orders
    add_foreign_key :orders_products, :products

    reversible do |change|
      change.up do
        execute %Q{ ALTER TABLE "orders_products" ADD PRIMARY KEY ("order_id", "product_id"); }

        execute "ALTER TABLE orders_products ADD CONSTRAINT price_is_positive CHECK (price > 0)"
        execute "ALTER TABLE orders_products ADD CONSTRAINT amount_is_positive CHECK (amount > 0)"
      end

      change.down do
        execute %Q{ ALTER TABLE "orders_products" DROP CONSTRAINT orders_products_pkey; }

        execute "ALTER TABLE orders_products DROP CONSTRAINT price_is_positive"
        execute "ALTER TABLE orders_products DROP CONSTRAINT amount_is_positive"
      end
    end
  end
end
