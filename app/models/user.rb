class User < ApplicationRecord
  has_many :user_stocks 
  has_many :stocks, through: :user_stocks 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable


  def can_track_stock(ticker_symbol) 
    stock_limit_reached? && !stock_already_added_to_portfolio?(ticker_symbol) 
  end


  def stock_limit_reached?
    stocks.count < 5
  end

  def stock_already_added_to_portfolio?(ticker_symbol)
    stock = Stock.check_for_stock_in_db(ticker_symbol)
    return false unless stock 
    !stocks.find_by(ticker: ticker_symbol).nil?
  end

  def full_name 
    return "#{first_name} #{last_name}" if first_name || last_name 
    return "<Name Not Set>"
  end
end
