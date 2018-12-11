class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards,  id: false do |t|
      t.string :number, null: false

      t.timestamps
    end
    add_reference :cards, :customer, index: true

    reversible do |change|
      change.up do
        execute %Q{ ALTER TABLE "cards" ADD PRIMARY KEY ("number"); }
      end

      change.down do
        execute %Q{ alter table "cards" drop constraint cards_pkey; }
      end
    end

  end

end
