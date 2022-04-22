require 'rails_helper'

RSpec.describe Menuitem, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:menuitem)).to be_valid
  end
  
  it 'is valid with a name and a description' do
    expect(FactoryBot.build(:menuitem)).to be_valid
  end

  it 'is invalid without a name' do
    menuitem = FactoryBot.build(:menuitem, name: nil)
    menuitem.valid?
    expect(menuitem.errors[:name]).to include("can't be blank")
  end

  it "is invalid with a duplicate name" do
    menuitem1 = FactoryBot.create(:menuitem, name: 'Nasi Uduk')
    menuitem2 = FactoryBot.build(:menuitem, name: 'Nasi Uduk')

    menuitem2.valid?

    expect(menuitem2.errors[:name]).to include("has already been taken")
  end

  it 'is invalid without a description' do
menuitem = FactoryBot.build(:menuitem, description: nil)

    menuitem.valid?

    expect(menuitem.errors[:description]).to include("can't be blank")
  end

  it 'is invalid with price value non numeric' do
    menuitem = Menuitem.new(
      name: "Nasi Uduk",
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 'ten thousand'
    )

    menuitem.valid?

    expect(menuitem.errors[:price]).to include("must be numeric")
  end

  it 'is invalid with price less than 0.01' do
    menuitem = Menuitem.new(
      name: "Nasi Uduk",
      description: 'Betawi style steamed rice cooked in coconut milk. Delicious!',
      price: 0
    )

    menuitem.valid?

    expect(menuitem.errors[:price]).to include("must be greater than or equal to 0.01")
  end

  it "has many item_categories" do
    should respond_to(:item_categories)
  end

  it "has many orderdetails" do
    should respond_to(:orderdetails)
  end
  
  describe 'self#by_letter' do
    context 'with matching letter' do
      it "should return a sorted array of results that match" do
        menuitem1 = FactoryBot.create(:menuitem, name: 'Nasi Uduk')
        menuitem2 = FactoryBot.create(:menuitem, name: 'Kerak Telor')
        menuitem3 = FactoryBot.create(:menuitem, name: 'Nasi Semur Jengkol')
  
        expect(Menuitem.by_letter("N")).to eq([menuitem3, menuitem1])
      end
    end
  end
end