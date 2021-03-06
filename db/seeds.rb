# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Menuitem.create(name: 'Nasi Uduk', description: 'Nasi Uduk is nice', price: 10000.0)
Menuitem.create(name: 'Pizza', description: 'Pizza is nice', price: 25000.0)
Menuitem.create(name: 'Es teh manis', description: 'Es teh manis is nice', price: 5000.0)

Category.create(name: 'Makanan Ringan')
Category.create(name: 'Makanan Berat')
Category.create(name: 'Minuman Dingin')
Category.create(name: 'Makanan Soda')

ItemCategory.create(menuitem_id: 1,category_id: 1)
ItemCategory.create(menuitem_id: 2,category_id: 2)
ItemCategory.create(menuitem_id: 3,category_id: 3)
ItemCategory.create(menuitem_id: 3,category_id: 4)

Customer.create(name: 'Waldo', phone: "+6281234567888", address: 'Jakarta', email:'waldofelix2@gmail.com')
Customer.create(name: 'Felix', phone: "+6281234567888", address: 'Jakarta', email:'waldofelix3@gmail.com')
Customer.create(name: 'Andi Budi', phone: "+6281234567999", address: 'Banding', email:'andibudi123@gmail.com')

Order.create(customer_id: 1, order_date: '2022-04-18', status: 'NEW')
Order.create(customer_id: 2, order_date: '2022-04-18', status: 'NEW')
Order.create(customer_id: 2, order_date: '2022-04-19', status: "PAID")
Order.create(customer_id: 3, order_date: Time.now, status: "NEW")
Order.create(customer_id: 1, order_date: Time.now, status: 'NEW')

Orderdetail.create(order_id: 1, menuitem_id: 1, quantity: 2)
Orderdetail.create(order_id: 1, menuitem_id: 2, quantity: 2)
Orderdetail.create(order_id: 2, menuitem_id: 2, quantity: 1)
Orderdetail.create(order_id: 2, menuitem_id: 3, quantity: 3)
Orderdetail.create(order_id: 3, menuitem_id: 2, quantity: 1)
Orderdetail.create(order_id: 4, menuitem_id: 1, quantity: 1)
Orderdetail.create(order_id: 4, menuitem_id: 3, quantity: 1)
Orderdetail.create(order_id: 5, menuitem_id: 3, quantity: 1)