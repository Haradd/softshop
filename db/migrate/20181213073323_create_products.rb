class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, limit: 50, null: false
      t.text :description
      t.decimal :price, precision: 15, scale: 2, null: false
      t.string :product_type_name, null: false, index: true
      t.string :publisher_name, null: false, index: true

      t.timestamps
    end

    add_foreign_key :products, :product_types, column: :product_type_name, primary_key: :name
    add_foreign_key :products, :publishers, column: :publisher_name, primary_key: :name
  end
end
