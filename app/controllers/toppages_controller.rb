class ToppagesController < ApplicationController
  def index
    gon.flickr_api_key = ENV['FLICKR_API_KEY']
    if logged_in?
      @memories = current_user.memories.order(date: :desc).page(params[:page]).per(8)
    end
  end
end
