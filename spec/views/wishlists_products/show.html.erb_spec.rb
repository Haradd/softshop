require 'rails_helper'

RSpec.describe "wishlists_products/show", type: :view do
  before(:each) do
    @wishlists_product = assign(:wishlists_product, WishlistsProduct.create!(
      :product => nil,
      :wishlist => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
