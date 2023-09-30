# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

verses = JSON.load_file("./db/verses.json")
176.times.map do |number|
  Verse.create_with(
    nasb: verses["nasb"][number],
    esv: verses["esv"][number],
    kjv: verses["kjv"][number]
  ).find_or_create_by!(number: number + 1)
end

VerseCommentary.delete_all

bridges = JSON.load_file("./db/bridges.json")
Commentary.where(source: "Exposition of Psalm 119 - Charles Bridges, 1827").delete_all
bridges.each do |verse|
  Commentary.create(
    verses: Verse.where(number: verse["verse_number"]),
    body: verse["commentary"].tr("\n", "\n\n"),
    source: "Exposition of Psalm 119 - Charles Bridges, 1827"
  )
end

spurgeon = JSON.load_file("./db/spurgeon.json")
Commentary.where(source: "The Golden Alphabet - Charles Spurgeon, 1887").delete_all
spurgeon.each do |verse|
  Commentary.create(
    verses: Verse.where(number: verse["verse_number"]),
    body: verse["commentary"].tr("\n", "\n\n"),
    source: "The Golden Alphabet - Charles Spurgeon, 1887"
  )
end
