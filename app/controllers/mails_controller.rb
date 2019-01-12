# frozen_string_literal: true

class MailsController < ApplicationController
  before_action :set_mail, only: [:show, :edit, :update, :destroy]

  # GET /mails
  def index
    @search_mails = Mail.search(params[:q_mail], search_key: :q_mail)
    @mails = @search_mails.result(distinct: true).page(params[:mails_page]).per(PAGE)
    @search_mails.build_condition
  end

  # GET /mails/1
  def show
  end

  # GET /mails/new
  def new
    @mail = Mail.new
  end

  # GET /mails/1/edit
  def edit
  end

  # POST /mails
  def create
    @mail = Mail.new(mail_params)

    if @mail.save
      redirect_to @mail, notice: 'Mail was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /mails/1
  def update
    if @mail.update(mail_params)
      redirect_to @mail, notice: 'Mail was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mails/1
  def destroy
    @mail.destroy
    redirect_to mails_url, notice: 'Mail was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mail
      @mail = Mail.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mail_params
      params.require(:mail).permit(:text, :newsletter_id)
    end
end
