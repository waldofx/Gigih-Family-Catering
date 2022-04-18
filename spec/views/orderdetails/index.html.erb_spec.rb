require 'rails_helper'

RSpec.describe "orderdetails/index", type: :view do
  before(:each) do
    assign(:orderdetails, [
      Orderdetail.create!(
        order_id: 2,
        menuitem_id: 3,
        quantity: 4,
        item_price: 5.5
      ),
      Orderdetail.create!(
        order_id: 2,
        menuitem_id: 3,
        quantity: 4,
        item_price: 5.5
      )
    ])
  end

  it "renders a list of orderdetails" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
    assert_select "tr>td", text: 5.5.to_s, count: 2
  end
end
