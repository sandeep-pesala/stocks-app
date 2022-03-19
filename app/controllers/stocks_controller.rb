class StocksController < ApplicationController

  def search 
    if params['stock'].present?
      @details_of_stock = Stock.new_lookup(params['stock'])
      if @details_of_stock
        render 'investors/my_portfolio'
      else  
        flash[:alert] = "Please enter a valid symbol"
        redirect_to my_portfolio_path
      end
    else 
      flash[:alert] = "Please enter a symbol to lookup"
      redirect_to my_portfolio_path
    end
  end
  
end