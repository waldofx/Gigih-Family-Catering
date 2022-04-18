# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Menuitem.create(name: 'Nasi Uduk', description: 'Nasi Uduk is nice', price: 25000)
Menuitem.create(name: 'Pizza', description: 'Pizza is nice', price: 80000)
Menuitem.create(name: 'Coke', description: 'Coke is nice', price: 15000)

Category.create(name: 'Makanan Ringan')
Category.create(name: 'Makanan Berat')

ItemCategory.create(menuitem_id: 1,category_id: 1)
ItemCategory.create(menuitem_id: 1,category_id: 2)
ItemCategory.create(menuitem_id: 2,category_id: 1)
ItemCategory.create(menuitem_id: 2,category_id: 2)
ItemCategory.create(menuitem_id: 3,category_id: 1)
ItemCategory.create(menuitem_id: 3,category_id: 2)

Customer.create(name: 'Waldo', phone: "+6281234567888", address: 'Jakarta', email:'waldofelix2@gmail.com')
Customer.create(name: 'Felix', phone: "+6281234567888", address: 'Jakarta', email:'waldofelix3@gmail.com')

Order.create(customer_id: 1, total: 95000, order_date: '2022-04-18', status: 'NEW')
Order.create(customer_id: 2, total: 95000, order_date: '2022-04-19', status: 'NEW')