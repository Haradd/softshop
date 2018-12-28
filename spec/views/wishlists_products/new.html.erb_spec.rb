require 'rails_helper'

RSpec.describe "wishlists_products/new", type: :view do
  before(:each) do
    assign(:wishlists_product, WishlistsProduct.new(
      :order => 1,
      :product => "",
      :wishlist => ""
    ))
  end

  it "renders new wishlists_product form" do
    render

    assert_select "form[action=?][method=?]", wishlists_products_path, "post" do

      assert_select "input[name=?]", "wishlists_product[order]"

      assert_select "input[name=?]", "wishlists_product[product]"

      assert_select "input[name=?]", "wishlists_product[wishlist]"
    end
  end
end
