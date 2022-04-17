# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Food.create(name: 'Burger', description: 'Burger is nice', price: 25000)
Food.create(name: 'Pizza', description: 'Pizza is nice', price: 80000)
Food.create(name: 'Coke', description: 'Coke is nice', price: 15000)

Category.create(name: 'Makanan Ringan')
Category.create(name: 'Makanan Berat')