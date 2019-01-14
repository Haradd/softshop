class WishlistsProductsController < ApplicationController
  before_action :set_wishlists_product, only: [:show, :edit, :update, :destroy]

  # GET /wishlists_products
  def index
    @search_wishlists_products = WishlistsProduct.search(params[:q_wishlists_product], search_key: :q_wishlists_product)
    @wishlists_products = @search_wishlists_products.result(distinct: true)
    @search_wishlists_products.build_condition
  end

  # GET /wishlists_products/1
  def show
  end

  # GET /wishlists_products/new
  def new
    @wishlists_product = WishlistsProduct.new
  end

  # GET /wishlists_products/1/edit
  def edit
  end

  # POST /wishlists_products
  def create
    @wishlists_product = WishlistsProduct.new(wishlists_product_params)

    if @wishlists_product.save
      redirect_to @wishlists_product, notice: 'Wishlists product was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /wishlists_products/1
  def update
    if @wishlists_product.update(wishlists_product_params)
      redirect_to @wishlists_product, notice: 'Wishlists product was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /wishlists_products/1
  def destroy
    @wishlists_product.destroy
    redirect_to wishlists_products_url, notice: 'Wishlists product was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wishlists_product
      @wishlists_product = WishlistsProduct.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def wishlists_product_params
      params.require(:wishlists_product).permit(:order, :product_id, :wishlist_id)
    end
end
