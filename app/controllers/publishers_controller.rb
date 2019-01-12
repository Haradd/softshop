# frozen_string_literal: true

class PublishersController < ApplicationController
  before_action :set_publisher, only: %i[show edit update destroy]

  # GET /publishers
  def index
    @search_publishers = Publisher.search(params[:q_publisher], search_key: :q_publisher)
    @publishers = @search_publishers.result(distinct: true)
    @search_publishers.build_condition
  end

  # GET /publishers/1
  def show
    @search_products = @publisher.products.search(params[:q_product], search_key: :q_product)
    @products = @search_products.result(distinct: true)
    @search_products.build_condition
  end

  # GET /publishers/new
  def new
    @publisher = Publisher.new
  end

  # GET /publishers/1/edit
  def edit
  end

  # POST /publishers
  def create
    @publisher = Publisher.new(publisher_params)

    if @publisher.save
      redirect_to @publisher, notice: 'Publisher was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /publishers/1
  def update
    if @publisher.update(publisher_params)
      redirect_to @publisher, notice: 'Publisher was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /publishers/1
  def destroy
    @publisher.destroy
    redirect_to publishers_url, notice: 'Publisher was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_publisher
    @publisher = Publisher.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def publisher_params
    params.require(:publisher).permit(:name, :description)
  end
end
