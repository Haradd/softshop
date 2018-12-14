require 'rails_helper'

RSpec.describe "wishlists_products/show", type: :view do
  before(:each) do
    @wishlists_product = assign(:wishlists_product, WishlistsProduct.create!(
      :order => 2,
      :product => "",
      :wishlist => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
