require 'rails_helper'

RSpec.describe "orderdetails/new", type: :view do
  before(:each) do
    assign(:orderdetail, Orderdetail.new(
      order_id: 1,
      menuitem_id: 1,
      quantity: 1,
      item_price: 1.5
    ))
  end

  it "renders new orderdetail form" do
    render

    assert_select "form[action=?][method=?]", orderdetails_path, "post" do

      assert_select "input[name=?]", "orderdetail[order_id]"

      assert_select "input[name=?]", "orderdetail[menuitem_id]"

      assert_select "input[name=?]", "orderdetail[quantity]"

      assert_select "input[name=?]", "orderdetail[item_price]"
    end
  end
end
