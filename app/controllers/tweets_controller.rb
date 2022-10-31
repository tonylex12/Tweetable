class TweetsController < ApplicationController
  # GET /tweets
  def index
    @tweets = Tweet.all
    @tweet = Tweet.new
  end

  # GET /tweets/1
  def show
    @tweet = Tweet.find(params[:id])
    @like = Like.find_by(tweet_id: params[:id])
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
    @tweet = Tweet.find(params[:id])
  end

  # POST /tweets
  def create
    user = current_user
    @new_weet = user.tweets.new(tweet_params)

    if @new_weet.save
      redirect_to root_path
    else
      redirect_to root_path, flash: { error: @new_weet.errors.full_messages }
    end
  end

  def reply
    user = current_user
    @tweet = Tweet.find(params[:id])
    @tweet.replies.create(body: params[:body], user: user)
    
    if @tweet.save
      redirect_to tweet_path(@tweet)
    else
      redirect_to tweet_path(@tweet), status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tweets/1
  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
      redirect_to @tweet
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /tweets/1
  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_url
  end

  private
    # Only allow a list of trusted parameters through.
    def tweet_params
      params.require(:tweet).permit(:body)
    end
end
