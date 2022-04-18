require 'rails_helper'

RSpec.describe "orderdetails/show", type: :view do
  before(:each) do
    @orderdetail = assign(:orderdetail, Orderdetail.create!(
      order_id: 2,
      menuitem_id: 3,
      quantity: 4,
      item_price: 5.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5.5/)
  end
end
