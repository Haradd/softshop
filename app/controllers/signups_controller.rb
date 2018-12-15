class SignupsController < ApplicationController
  before_action :set_signup, only: [:show, :edit, :update, :destroy]

  # GET /signups
  def index
    @signups = Signup.all
  end

  # GET /signups/1
  def show
  end

  # GET /signups/new
  def new
    @signup = Signup.new
  end

  # GET /signups/1/edit
  def edit
  end

  # POST /signups
  def create
    @signup = Signup.new(signup_params)

    if @signup.save
      redirect_to @signup, notice: 'Signup was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /signups/1
  def update
    if @signup.update(signup_params)
      redirect_to @signup, notice: 'Signup was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /signups/1
  def destroy
    @signup.destroy
    redirect_to signups_url, notice: 'Signup was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_signup
      @signup = Signup.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def signup_params
      params.require(:signup).permit(:active, :customer_id, :newsletter_id)
    end
end
