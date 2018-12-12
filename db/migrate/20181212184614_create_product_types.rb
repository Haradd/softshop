class CreateProductTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :product_types, id: false do |t|
      t.string :name, null: false, limit: 100
      t.text :description, limit: 300

      t.timestamps
    end

    reversible do |change|
      change.up do
        execute %Q{ ALTER TABLE "product_types" ADD PRIMARY KEY ("name"); }
      end

      change.down do
        execute %Q{ ALTER TABLE "product_types" DROP CONSTRAINT product_types_pkey; }
      end
    end
  end
end
