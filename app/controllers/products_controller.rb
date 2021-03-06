class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  def index
    @search_products = Product.search(params[:q_product], search_key: :q_product)
    @products = @search_products.result(distinct: true).page(params[:products_page]).per(PAGE)
    @search_products.build_condition
  end

  # GET /products/1
  def show
    @search_orders = @product.orders.search(params[:q_order], search_key: :q_order)
    @orders = @search_orders.result(distinct: true).page(params[:orders_page]).per(PAGE)
    @search_orders.build_condition

    @search_wishlists = @product.wishlists.search(params[:q_wishlist], search_key: :q_wishlist)
    @wishlists = @search_wishlists.result(distinct: true).page(params[:wishlists_page]).per(PAGE)
    @search_wishlists.build_condition
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :product_type_name, :publisher_name)
    end
end
