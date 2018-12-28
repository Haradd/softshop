require 'rails_helper'

RSpec.describe "orders_products/index", type: :view do
  before(:each) do
    assign(:orders_products, [
      OrdersProduct.create!(
        :amount => "",
        :price => "9.99",
        :order => nil,
        :product => nil
      ),
      OrdersProduct.create!(
        :amount => "",
        :price => "9.99",
        :order => nil,
        :product => nil
      )
    ])
  end

  it "renders a list of orders_products" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
