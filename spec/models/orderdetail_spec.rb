require 'rails_helper'

RSpec.describe Orderdetail, type: :model do
  it "has a valid factory" do
    Menuitem.create(name: 'Nasi Gempreng', description: 'Nasi Uduk is nice', price: 10000.0)
    Customer.create(name: 'Xilef', phone: "+6281234567888", address: 'Jakarta', email:'waldofelix2@gmail.com')
    Order.create(customer_id: 1, order_date: '2022-04-18', status: 'NEW')
    expect(FactoryBot.build(:orderdetail)).to be_valid
  end
  
  it 'is valid with an order_id, menuitem_id, and quantity' do
    Menuitem.create(name: 'Nasi Gempreng', description: 'Nasi Uduk is nice', price: 10000.0)
    Customer.create(name: 'Xilef', phone: "+6281234567888", address: 'Jakarta', email:'waldofelix2@gmail.com')
    Order.create(customer_id: 1, order_date: '2022-04-18', status: 'NEW')
    expect(FactoryBot.build(:orderdetail)).to be_valid
  end

  it 'is invalid without an order_id' do
    orderdetail = FactoryBot.build(:orderdetail, order_id:nil)
    orderdetail.valid?
    expect(orderdetail.errors[:order_id]).to include("can't be blank")
  end

  it 'is invalid without an menuitem_id' do
    orderdetail = FactoryBot.build(:orderdetail, menuitem_id:nil)
    orderdetail.valid?
    expect(orderdetail.errors[:menuitem_id]).to include("can't be blank")
  end

  it 'is invalid without an quantity' do
    orderdetail = FactoryBot.build(:orderdetail, quantity:nil)
    orderdetail.valid?
    expect(orderdetail.errors[:quantity]).to include("can't be blank")
  end

  it "belongs to order" do
    t = Orderdetail.reflect_on_association(:order)
    expect(t.macro).to eq(:belongs_to)
  end

  it "belongs to menuitem" do
    t = Orderdetail.reflect_on_association(:menuitem)
    expect(t.macro).to eq(:belongs_to)
  end

  it 'should correctly count total from item_price * quantity' do  
    Customer.create(name: 'Xilef', phone: "+6281234567888", address: 'Jakarta', email:'waldofelix3@gmail.com')
    Order.create(customer_id: 1, order_date: '2022-04-18', status: 'NEW')
    Menuitem.create(name: 'Nasi Gempreng', description: 'Nasi Uduk is nice', price: 10000.0)

    Orderdetail.create(order_id: 1, menuitem_id: 1, quantity: 2)

    orderdetail1 = Orderdetail.find(1)
    
    expect(orderdetail1[:total]).to eq(20000.0)
  end
end
