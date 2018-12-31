# frozen_string_literal: true

class OrdersProductsController < ApplicationController
  before_action :set_orders_product, only: [:show, :edit, :update, :destroy]

  # GET /orders_products
  def index
    @search = OrdersProduct.search(params[:q])
    @orders_products = @search.result(distinct: true)
    @search.build_condition
  end

  # GET /orders_products/1
  def show
  end

  # GET /orders_products/new
  def new
    @orders_product = OrdersProduct.new
  end

  # GET /orders_products/1/edit
  def edit
  end

  # POST /orders_products
  def create
    @orders_product = OrdersProduct.new(orders_product_params)

    if @orders_product.save
      redirect_to @orders_product, notice: 'Orders product was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /orders_products/1
  def update
    if @orders_product.update(orders_product_params)
      redirect_to @orders_product, notice: 'Orders product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /orders_products/1
  def destroy
    @orders_product.destroy
    redirect_to orders_products_url, notice: 'Orders product was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_orders_product
      @orders_product = OrdersProduct.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def orders_product_params
      params.require(:orders_product).permit(:amount, :price, :order_id, :product_id)
    end
end
