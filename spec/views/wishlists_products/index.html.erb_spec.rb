require 'rails_helper'

RSpec.describe "wishlists_products/index", type: :view do
  before(:each) do
    assign(:wishlists_products, [
      WishlistsProduct.create!(
        :product => nil,
        :wishlist => nil
      ),
      WishlistsProduct.create!(
        :product => nil,
        :wishlist => nil
      )
    ])
  end

  it "renders a list of wishlists_products" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
