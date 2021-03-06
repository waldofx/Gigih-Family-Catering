require 'rails_helper'

RSpec.describe ItemCategory, type: :model do
  it "has a valid factory" do
    Menuitem.create(name: 'Nasi Uduk', description: 'Nasi Uduk is nice', price: 10000.0)
    Category.create(name: 'Makanan Ringan')
    expect(FactoryBot.build(:item_category)).to be_valid
  end
  
  it 'is valid with both ids' do
    Menuitem.create(name: 'Nasi Uduk', description: 'Nasi Uduk is nice', price: 10000.0)
    Category.create(name: 'Makanan Ringan')
    expect(FactoryBot.build(:item_category)).to be_valid
  end

  it 'is invalid without an item id' do
    Menuitem.create(name: 'Nasi Uduk', description: 'Nasi Uduk is nice', price: 10000.0)
    Category.create(name: 'Makanan Ringan')
    itemcategory = FactoryBot.build(:item_category, menuitem_id: nil)
    itemcategory.valid?
    expect(itemcategory.errors[:menuitem_id]).to include("can't be blank")
  end

  it 'is invalid without an category id' do
    Menuitem.create(name: 'Nasi Uduk', description: 'Nasi Uduk is nice', price: 10000.0)
    Category.create(name: 'Makanan Ringan')
    itemcategory = FactoryBot.build(:item_category, category_id: nil)
    itemcategory.valid?
    expect(itemcategory.errors[:category_id]).to include("can't be blank")
  end

  it "belongs to category" do
    t = ItemCategory.reflect_on_association(:category)
    expect(t.macro).to eq(:belongs_to)
  end

  it "belongs to menuitem" do
    t = ItemCategory.reflect_on_association(:menuitem)
    expect(t.macro).to eq(:belongs_to)
  end
end
