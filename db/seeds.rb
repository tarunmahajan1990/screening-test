# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create a library
library = Library.create(name: "Example Library")

# Create books for the library
library.books.create(title: "Book 1", author: "Author 1", status: "available")
library.books.create(title: "Book 2", author: "Author 2", status: "checked_out", checked_out_by: "John Doe")
library.books.create(title: "Book 3", author: "Author 3", status: "available")
