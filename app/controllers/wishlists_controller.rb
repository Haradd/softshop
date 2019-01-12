# frozen_string_literal: true

class WishlistsController < ApplicationController
  before_action :set_wishlist, only: %i[show edit update destroy]

  # GET /wishlists
  def index
    @search_wishlist = Wishlist.search(params[:q_wishlist], search_key: :q_wishlist)
    @wishlists = @search_wishlist.result(distinct: true)
    @search_wishlist.build_condition
  end

  # GET /wishlists/1
  def show
  end

  # GET /wishlists/new
  def new
    @wishlist = Wishlist.new
  end

  # GET /wishlists/1/edit
  def edit
  end

  # POST /wishlists
  def create
    @wishlist = Wishlist.new(wishlist_params)

    if @wishlist.save
      redirect_to @wishlist, notice: 'Wishlist was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /wishlists/1
  def update
    if @wishlist.update(wishlist_params)
      redirect_to @wishlist, notice: 'Wishlist was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /wishlists/1
  def destroy
    @wishlist.destroy
    redirect_to wishlists_url, notice: 'Wishlist was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_wishlist
    @wishlist = Wishlist.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def wishlist_params
    params.require(:wishlist).permit(:name, :customer_id)
  end
end
