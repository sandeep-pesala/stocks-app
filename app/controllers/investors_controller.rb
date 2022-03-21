class InvestorsController < ApplicationController
  before_action :set_investor, only: %i[ show edit update destroy ]

  # GET /investors or /investors.json
  def index
    my_portfolio
  end

  def my_portfolio 
    @my_stocks = current_user.stocks
  end

  def my_friends 
    @my_friends = current_user.friends 
  end

  def search_users 
    if params['email'].present?
      @details_of_user = User.search_user(params['email'])
      if @details_of_user
        render 'investors/search_users'
      else  
        flash[:alert] = "User with #{params['email']} is not present"
        redirect_to friends_path
      end
    else 
      flash[:alert] = "Please enter a email to search"
      redirect_to friends_path
    end
  end
end
