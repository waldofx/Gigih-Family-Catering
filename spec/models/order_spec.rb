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
end
