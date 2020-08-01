class ToppagesController < ApplicationController
  def index
    gon.flickr_api_key = ENV['FLICKR_API_KEY']
    if logged_in?
      @memories = current_user.feed_memories.order(date: :desc).page(params[:page]).per(8)
    end
  end
end
