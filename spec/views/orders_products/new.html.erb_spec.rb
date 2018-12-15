require 'rails_helper'

RSpec.describe "orders_products/new", type: :view do
  before(:each) do
    assign(:orders_product, OrdersProduct.new(
      :amount => "",
      :price => "9.99",
      :order => nil,
      :product => nil
    ))
  end

  it "renders new orders_product form" do
    render

    assert_select "form[action=?][method=?]", orders_products_path, "post" do

      assert_select "input[name=?]", "orders_product[amount]"

      assert_select "input[name=?]", "orders_product[price]"

      assert_select "input[name=?]", "orders_product[order_id]"

      assert_select "input[name=?]", "orders_product[product_id]"
    end
  end
end
