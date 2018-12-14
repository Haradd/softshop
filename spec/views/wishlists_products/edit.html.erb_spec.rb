require 'rails_helper'

RSpec.describe "wishlists_products/edit", type: :view do
  before(:each) do
    @wishlists_product = assign(:wishlists_product, WishlistsProduct.create!(
      :product => nil,
      :wishlist => nil
    ))
  end

  it "renders the edit wishlists_product form" do
    render

    assert_select "form[action=?][method=?]", wishlists_product_path(@wishlists_product), "post" do

      assert_select "input[name=?]", "wishlists_product[product_id]"

      assert_select "input[name=?]", "wishlists_product[wishlist_id]"
    end
  end
end
