class UserStocksController < ApplicationController
  def create 
    stock = Stock.check_for_stock_in_db(params[:ticker])
    if stock.blank?
      stock = Stock.new_lookup(params['ticker'])
      stock.save
    end
    @user_stock = UserStock.create(user: current_user, stock: stock)
    flash[:notice] = "Stock #{stock.name} added successfully to portfolio"
    redirect_to  my_portfolio_path
  end

  def destroy
    stock = Stock.find(params[:id])
    user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
    user_stock.destroy 
    flash[:notice] = "#{stock.ticker} was successfully removed from the portfolio"
    redirect_to root_path
  end
end
