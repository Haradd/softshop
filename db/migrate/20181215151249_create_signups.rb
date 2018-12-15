class CreateSignups < ActiveRecord::Migration[5.2]
  def change
    create_table :signups, id: false do |t|
      t.boolean :active, null: false, default: true
      t.bigint :customer_id, null: false
      t.bigint :newsletter_id, null: false

      t.timestamps
    end

    add_foreign_key :signups, :customers
    add_foreign_key :signups, :newsletters


    reversible do |change|
      change.up do
        execute %Q{ ALTER TABLE "signups" ADD PRIMARY KEY ("customer_id", "newsletter_id"); }
      end

      change.down do
        execute %Q{ ALTER TABLE "signups" DROP CONSTRAINT signups_pkey; }
      end
    end
  end
end
