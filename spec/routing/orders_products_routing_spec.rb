require "rails_helper"

RSpec.describe OrdersProductsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/orders_products").to route_to("orders_products#index")
    end

    it "routes to #new" do
      expect(:get => "/orders_products/new").to route_to("orders_products#new")
    end

    it "routes to #show" do
      expect(:get => "/orders_products/1").to route_to("orders_products#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/orders_products/1/edit").to route_to("orders_products#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/orders_products").to route_to("orders_products#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/orders_products/1").to route_to("orders_products#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/orders_products/1").to route_to("orders_products#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/orders_products/1").to route_to("orders_products#destroy", :id => "1")
    end
  end
end
