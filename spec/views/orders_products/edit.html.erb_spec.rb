require 'rails_helper'

RSpec.describe "orders_products/edit", type: :view do
  before(:each) do
    @orders_product = assign(:orders_product, OrdersProduct.create!(
      :amount => "",
      :price => "9.99",
      :order => nil,
      :product => nil
    ))
  end

  it "renders the edit orders_product form" do
    render

    assert_select "form[action=?][method=?]", orders_product_path(@orders_product), "post" do

      assert_select "input[name=?]", "orders_product[amount]"

      assert_select "input[name=?]", "orders_product[price]"

      assert_select "input[name=?]", "orders_product[order_id]"

      assert_select "input[name=?]", "orders_product[product_id]"
    end
  end
end
