class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  # GET /users/1
  def show
    @user = User.find(params[:id])
    return redirect_to root_path unless @user

    @tweets = Tweet.where(user_id: params[:id])
    @likes = Like.where(user_id: params[:id])
    @likeds = Tweet.where(id: @likes.pluck(:tweet_id))
  end

end
