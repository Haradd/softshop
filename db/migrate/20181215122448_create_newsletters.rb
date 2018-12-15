class CreateNewsletters < ActiveRecord::Migration[5.2]
  def change
    create_table :newsletters do |t|
      t.string :title, limit: 200, null: false
      t.string :product_type_name, null: false, index: true

      t.timestamps
    end

    add_foreign_key :newsletters, :product_types, column: :product_type_name, primary_key: :name
  end
end
