# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
100.times do |i|
  Library.create(name: "Library #{i+1}", address: "Address #{i+1}")
end

100.times do |i|
  book = Book.create(title: "Book #{i+1}", description: "Description #{i+1}")
  book.update(library_id: rand(1..100))
end

100.times do |i|
  Author.create(name: "Author #{i+1}")
end

genres = ["Fantasy", "Science Fiction", "Mystery", "Romance", "Thriller", "Horror", "Historical Fiction", "Non-Fiction", "Biography", "Poetry"]
genres.each do |genre|
  Genre.create(name: genre)
end

100.times do |i|
  card = LibraryCard.create(number: "Card #{i+1}")
  card.update(library_id: rand(1..100))
end

100.times do |i|
  user = User.create(name: "User #{i+1}")
  user.update(library_card_id: rand(1..100))
end
