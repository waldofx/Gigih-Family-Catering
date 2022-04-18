require 'rails_helper'

RSpec.describe Customer, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:customer)).to be_valid
  end
  
  it 'is valid with a full data' do
    expect(FactoryBot.build(:customer)).to be_valid
  end

  it 'is invalid without a name' do
    customer = FactoryBot.build(:customer, name: nil)
    customer.valid?
    expect(customer.errors[:name]).to include("can't be blank")
  end

  it 'is invalid without a phone' do
    customer = FactoryBot.build(:customer, phone: nil)
    customer.valid?
    expect(customer.errors[:phone]).to include("can't be blank")
  end

  it 'is invalid without a address' do
    customer = FactoryBot.build(:customer, address: nil)
    customer.valid?
    expect(customer.errors[:address]).to include("can't be blank")
  end

  it 'is invalid without a email' do
    customer = FactoryBot.build(:customer, email: nil)
    customer.valid?
    expect(customer.errors[:email]).to include("can't be blank")
  end

  it 'is invalid with wrong email format' do
    customer = FactoryBot.build(:customer, email: "halo@gigih")
    customer.valid?
    expect(customer.errors[:email]).to include("is not a valid email address")
  end

  it "has many orders" do
    should respond_to(:orders)
  end
end
