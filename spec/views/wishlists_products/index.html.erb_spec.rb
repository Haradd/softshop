require 'rails_helper'

RSpec.describe "wishlists_products/index", type: :view do
  before(:each) do
    assign(:wishlists_products, [
      WishlistsProduct.create!(
        :order => 2,
        :product => "",
        :wishlist => ""
      ),
      WishlistsProduct.create!(
        :order => 2,
        :product => "",
        :wishlist => ""
      )
    ])
  end

  it "renders a list of wishlists_products" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
