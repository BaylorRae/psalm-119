class CreateCommentaries < ActiveRecord::Migration[7.1]
  def change
    create_table :commentaries do |t|
      t.string :source, null: false
      t.text :body, null: false

      t.timestamps
    end
  end
end
