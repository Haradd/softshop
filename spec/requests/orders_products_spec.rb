require 'rails_helper'

RSpec.describe "OrdersProducts", type: :request do
  describe "GET /orders_products" do
    it "works! (now write some real specs)" do
      get orders_products_path
      expect(response).to have_http_status(200)
    end
  end
end
