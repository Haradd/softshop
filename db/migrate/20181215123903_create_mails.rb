class CreateMails < ActiveRecord::Migration[5.2]
  def change
    create_table :mails do |t|
      t.text :text, null: false
      t.references :newsletter, foreign_key: true, index: true, null: false

      t.timestamps
    end
  end
end
