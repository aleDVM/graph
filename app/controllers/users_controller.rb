class UsersController < ApplicationController
  def index
  	@users = User.includes(:tweets)
  	#@tweets_count = Tweet.group(:user_id).count
  	# @tweets_count = User.includes(:tweets).collect{|user| [user.name, user.tweets.size]}
  	#@tweets_count = User.eager_load(:tweets).group("users.id, tweets.user_id").count
  	#@tweets_count = User.joins(:tweets).group('user_id, tweets.user_id').select("users.*, count(tweets.id) as count_of_twwets").collect{ | user | [user.name, user.count_of_twwets]}
  	@tweets_count = User.includes(:tweets).group("tweets.user_id").pluck("users.name, count(tweets.id)")
  end
end
