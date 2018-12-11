class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :first_name, limit: 30, null: false
      t.string :last_name, limit: 30, null: false
      t.string :email, limit: 50, null: false
      t.string :phone_number, limit: 15

      t.timestamps
    end

    add_index :customers, [:first_name, :last_name]
    add_index :customers, :email, unique: true
  end
end
