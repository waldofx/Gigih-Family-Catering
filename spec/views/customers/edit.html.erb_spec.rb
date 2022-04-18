require 'rails_helper'

RSpec.describe "customers/edit", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      name: "MyString",
      phone: 1,
      address: "MyString",
      email: "MyString"
    ))
  end

  it "renders the edit customer form" do
    render

    assert_select "form[action=?][method=?]", customer_path(@customer), "post" do

      assert_select "input[name=?]", "customer[name]"

      assert_select "input[name=?]", "customer[phone]"

      assert_select "input[name=?]", "customer[address]"

      assert_select "input[name=?]", "customer[email]"
    end
  end
end
