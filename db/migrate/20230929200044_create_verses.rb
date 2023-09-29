class CreateVerses < ActiveRecord::Migration[7.1]
  def change
    create_table :verses do |t|
      t.integer :number, null: false
      t.string :nasb, null: false
      t.string :esv, null: false
      t.string :kjv, null: false

      t.timestamps
    end

    add_index :verses, :number, unique: true
  end
end
