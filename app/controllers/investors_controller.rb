class InvestorsController < ApplicationController
  before_action :set_investor, only: %i[ show compose_email ]

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

  def list_all_users 
    flash[:alert] = "You do not have access" unless current_user.admin
    @all_users = User.all
  end

  def search_users 
    if params['search_word'].present?
      @details_of_user = User.search_user(params['search_word'])
      if @details_of_user
        render 'investors/search_users'
      else  
        flash[:alert] = "User with #{params['search_word']} is not present"
        redirect_to friends_path
      end
    else 
      flash[:alert] = "Please enter a info to search"
      redirect_to friends_path
    end
  end

  def show
  end

  def follow_the_investor
    unless already_following
      User.follow_user(params[:id], current_user.id)
      increment_followers_following_count
      redirect_to friends_path
    else 
      flash[:alert] = "You are already following this user"
    end
  end

  def unfollow_the_investor 
    if already_following
      User.unfollow_user(params[:id], current_user.id)
      decrement_followers_following_count
      redirect_to friends_path
    end 
  end

  def compose_email
    
  end

  def send_email 

  end

  private 
  def set_investor
    @investor = User.find(params[:id])
  end

  def already_following
    friendships = Friendship.where(user_id: current_user.id , friend_id: params[:id])
    !friendships.empty?
  end

  def increment_followers_following_count
    current_user.following += 1
    current_user.save
    user = User.find(params[:id])
    user.followers += 1
    user.save
  end

  def decrement_followers_following_count 
    current_user.following -= 1
    current_user.save
    user = User.find(params[:id])
    user.followers -= 1
    user.save
  end 


end
