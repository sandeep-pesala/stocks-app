class User < ApplicationRecord
  has_many :user_stocks 
  has_many :stocks, through: :user_stocks 
  has_many :friendships
  has_many :friends, through: :friendships
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

  def self.search_user(search_term)
    if search_term.blank?  # blank? covers both nil and empty string
      all
    else
      search_functions = []
      search_terms = search_term.split(' ').map{|word| "%#{word.downcase}%"}
      search_terms.length.times do |i|
        search_functions << 'LOWER(email) LIKE ?'
        search_functions << 'LOWER(first_name) LIKE ?'
        search_functions << 'LOWER(last_name) LIKE ?'
      end
      like_patterns = search_functions.join(' or ')
      where("#{like_patterns}", search_term, search_term, search_term)
    end
  end

  def self.follow_user(target_user_id, current_user_id)
    new_friendship = Friendship.create(user_id: current_user_id , friend_id: target_user_id)
  end 

  def self.unfollow_user(target_user_id, current_user_id)
    old_friendship = Friendship.where(user_id: current_user_id, friend_id: target_user_id).destroy_all
  end

end
