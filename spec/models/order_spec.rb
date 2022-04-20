require 'rails_helper'

RSpec.describe Order, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:order)).to be_valid
  end
  
  it 'is valid with a full data' do
    expect(FactoryBot.build(:order)).to be_valid
  end

  it 'is invalid without a customer_id' do
    order = FactoryBot.build(:order, customer_id: nil)
    order.valid?
    expect(order.errors[:customer_id]).to include("can't be blank")
  end

  it "belongs to customer" do
    t = Order.reflect_on_association(:customer)
    expect(t.macro).to eq(:belongs_to)
  end

  it "has many orderdetails" do
    should respond_to(:orderdetails)
  end

  it 'should correctly count total from all orderdetails' do  
    Customer.create(name: 'Xilef', phone: "+6281234567888", address: 'Jakarta', email:'waldofelix3@gmail.com')
    Order.create(customer_id: 1, order_date: '2022-04-18', status: 'NEW')
    Menuitem.create(name: 'Nasi Gempreng', description: 'Nasi Uduk is nice', price: 10000.0)
    Menuitem.create(name: 'Nasi Jombrong', description: 'Nasi Jombrong is nice', price: 5000.0)

    Orderdetail.create(order_id: 1, menuitem_id: 1, quantity: 2)
    Orderdetail.create(order_id: 1, menuitem_id: 2, quantity: 1)

    order1 = Order.find(1)

    expect(order1[:total]).to eq(25000.0)
  end
end
