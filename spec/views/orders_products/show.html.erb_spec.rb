require 'rails_helper'

RSpec.describe "orders_products/show", type: :view do
  before(:each) do
    @orders_product = assign(:orders_product, OrdersProduct.create!(
      :amount => "",
      :price => "9.99",
      :order => nil,
      :product => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
