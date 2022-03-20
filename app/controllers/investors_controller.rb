class InvestorsController < ApplicationController
  before_action :set_investor, only: %i[ show edit update destroy ]

  # GET /investors or /investors.json
  def index
    my_portfolio
  end

  def my_portfolio 
    @my_stocks = current_user.stocks
  end
end
