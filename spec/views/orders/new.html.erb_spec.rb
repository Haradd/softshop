require 'rails_helper'

RSpec.describe "orders/new", type: :view do
  before(:each) do
    assign(:order, Order.new(
      :price => "9.99",
      :status => "MyString",
      :customer => "",
      :card => ""
    ))
  end

  it "renders new order form" do
    render

    assert_select "form[action=?][method=?]", orders_path, "post" do

      assert_select "input[name=?]", "order[price]"

      assert_select "input[name=?]", "order[status]"

      assert_select "input[name=?]", "order[customer]"

      assert_select "input[name=?]", "order[card]"
    end
  end
end
