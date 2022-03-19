class InvestorsController < ApplicationController
  before_action :set_investor, only: %i[ show edit update destroy ]

  # GET /investors or /investors.json
  def index
    @investors = Investor.all
  end

  # GET /investors/1 or /investors/1.json
  def show
  end

  # GET /investors/new
  def new
    @investor = Investor.new
  end

  # GET /investors/1/edit
  def edit
  end

  def my_portfolio 
  end

  # POST /investors or /investors.json
  def create
    @investor = Investor.new(investor_params)

    respond_to do |format|
      if @investor.save
        format.html { redirect_to investor_url(@investor), notice: "Investor was successfully created." }
        format.json { render :show, status: :created, location: @investor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @investor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /investors/1 or /investors/1.json
  def update
    respond_to do |format|
      if @investor.update(investor_params)
        format.html { redirect_to investor_url(@investor), notice: "Investor was successfully updated." }
        format.json { render :show, status: :ok, location: @investor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @investor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /investors/1 or /investors/1.json
  def destroy
    @investor.destroy

    respond_to do |format|
      format.html { redirect_to investors_url, notice: "Investor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_investor
      @investor = Investor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def investor_params
      params.fetch(:investor, {})
    end
end
