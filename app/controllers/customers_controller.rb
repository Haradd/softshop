# frozen_string_literal: true

class CustomersController < ApplicationController
  before_action :set_customer, only: %i[show edit update destroy]

  # GET /customers
  def index
    @search_customer = Customer.search(params[:q_customer], search_key: :q_customer)
    @customers = @search_customer.result(distinct: true).page(params[:page]).per(PAGE)
    @search_customer.build_condition
  end

  # GET /customers/1
  def show
    @search_orders = @customer.orders.search(params[:q_order], search_key: :q_order)
    @orders = @search_orders.result(distinct: true).page(params[:orders_page]).per(PAGE)
    @search_orders.build_condition

    @search_wishlists = @customer.wishlists.search(params[:q_wishlist], search_key: :q_wishlist)
    @wishlists = @search_wishlists.result(distinct: true).page(params[:wishlists_page]).per(PAGE)
    @search_wishlists.build_condition

    @search_cards = @customer.cards.search(params[:q_card], search_key: :q_card)
    @cards = @search_cards.result(distinct: true).page(params[:cards_page]).per(PAGE)
    @search_cards.build_condition
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  def create
    @customer = Customer.new(customer_params)

    if @customer.save
      redirect_to @customer, notice: 'Customer was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /customers/1
  def update
    if @customer.update(customer_params)
      redirect_to @customer, notice: 'Customer was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /customers/1
  def destroy
    @customer.destroy
    redirect_to customers_url, notice: 'Customer was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_customer
    @customer = Customer.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :phone_number, :string)
  end
end
