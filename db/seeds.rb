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
  ).find_or_create_by!(number: number)
end
