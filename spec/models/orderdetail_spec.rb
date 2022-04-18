require 'rails_helper'

RSpec.describe Orderdetail, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:orderdetail)).to be_valid
  end
  
  it 'is valid with an order_id, menuitem_id, and quantity' do
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
end
