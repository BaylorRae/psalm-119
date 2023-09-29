class CreateVerseCommentaries < ActiveRecord::Migration[7.1]
  def change
    create_table :verse_commentaries do |t|
      t.belongs_to :verse, null: false, foreign_key: true
      t.belongs_to :commentary, null: false, foreign_key: true

      t.timestamps
    end

    add_index :verse_commentaries, [:verse_id, :commentary_id], unique: true
  end
end
