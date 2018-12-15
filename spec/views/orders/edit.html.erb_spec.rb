require 'rails_helper'

RSpec.describe "orders/edit", type: :view do
  before(:each) do
    @order = assign(:order, Order.create!(
      :price => "9.99",
      :status => "MyString",
      :customer => "",
      :card => ""
    ))
  end

  it "renders the edit order form" do
    render

    assert_select "form[action=?][method=?]", order_path(@order), "post" do

      assert_select "input[name=?]", "order[price]"

      assert_select "input[name=?]", "order[status]"

      assert_select "input[name=?]", "order[customer]"

      assert_select "input[name=?]", "order[card]"
    end
  end
end
