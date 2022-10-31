class LikesController < ApplicationController

  def create
    user = current_user
    tweet = Tweet.find_by(id: params[:tweet_id])
    like = Like.new(user: user, tweet: tweet)
    like.save
    redirect_back fallback_location: '/'
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    redirect_back fallback_location: '/'
  end

end
