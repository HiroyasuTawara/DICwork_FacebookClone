class FeedsController < ApplicationController
  before_action :set_feed, only: %i[ show edit update destroy ]

  def index
    @feeds = Feed.all
  end

  def show
  end

  def new
    @feed = Feed.new
  end

  def edit
  end

  def create
    @feed = Feed.new(feed_params)
    if @feed.save
      redirect_to feed_url(@feed), notice: "Feed was successfully created." 
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @feed.update(feed_params)
      redirect_to feed_url(@feed), notice: "Feed was successfully updated." 
    else
      render :edit, status: :unprocessable_entity 
    end
  end

  def destroy
    @feed.destroy
    redirect_to feeds_url, notice: "Feed was successfully destroyed." 
  end

  private
    def set_feed
      @feed = Feed.find(params[:id])
    end

    def feed_params
      params.require(:feed).permit(:image, :image_cache, :blog_id)
    end
end
