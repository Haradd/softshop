require 'rails_helper'

RSpec.describe "wishlists_products/new", type: :view do
  before(:each) do
    assign(:wishlists_product, WishlistsProduct.new(
      :product => nil,
      :wishlist => nil
    ))
  end

  it "renders new wishlists_product form" do
    render

    assert_select "form[action=?][method=?]", wishlists_products_path, "post" do

      assert_select "input[name=?]", "wishlists_product[product_id]"

      assert_select "input[name=?]", "wishlists_product[wishlist_id]"
    end
  end
end
