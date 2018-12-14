require 'rails_helper'

RSpec.describe "WishlistsProducts", type: :request do
  describe "GET /wishlists_products" do
    it "works! (now write some real specs)" do
      get wishlists_products_path
      expect(response).to have_http_status(200)
    end
  end
end
