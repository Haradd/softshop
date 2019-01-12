# frozen_string_literal: true

class NewslettersController < ApplicationController
  before_action :set_newsletter, only: [:show, :edit, :update, :destroy]

  # GET /newsletters
  def index
    @search_newsletters = Newsletter.search(params[:q])
    @newsletters = @search_newsletters.result(distinct: true).page(params[:newsletters_page]).per(PAGE)
    @search_newsletters.build_condition
  end

  # GET /newsletters/1
  def show
    @search_customers = @newsletter.customers.search(params[:q_customer], search_key: :q_customer)
    @customers = @search_customers.result(distinct: true).page(params[:customers_page]).per(PAGE)
    @search_customers.build_condition

    @search_mails = @newsletter.mails.search(params[:q_mail], search_key: :q_mail)
    @mails = @search_mails.result(distinct: true).page(params[:mails_page]).per(PAGE)
    @search_mails.build_condition
  end

  # GET /newsletters/new
  def new
    @newsletter = Newsletter.new
  end

  # GET /newsletters/1/edit
  def edit
  end

  # POST /newsletters
  def create
    @newsletter = Newsletter.new(newsletter_params)

    if @newsletter.save
      redirect_to @newsletter, notice: 'Newsletter was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /newsletters/1
  def update
    if @newsletter.update(newsletter_params)
      redirect_to @newsletter, notice: 'Newsletter was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /newsletters/1
  def destroy
    @newsletter.destroy
    redirect_to newsletters_url, notice: 'Newsletter was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_newsletter
      @newsletter = Newsletter.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def newsletter_params
      params.require(:newsletter).permit(:title, :product_type_name)
    end
end
