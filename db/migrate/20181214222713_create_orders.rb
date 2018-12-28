class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.timestamp :payment_date
      t.decimal :price, precision: 15, scale: 2, null: false
      t.string :status, null: false
      t.bigint :customer_id, limit: 8, null: false, index: true
      t.string :card_number, null: false, index: true

      t.timestamps
    end

    add_foreign_key :orders, :customers
    add_foreign_key :orders, :cards, column: :card_number, primary_key: :number

    reversible do |change|
      change.up do
        execute "ALTER TABLE orders ADD CONSTRAINT price_is_positive CHECK (price > 0)"
      end

      change.down do
        execute "ALTER TABLE orders DROP CONSTRAINT price_is_positive"
      end
    end
  end
end
