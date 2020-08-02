class ToppagesController < ApplicationController
  def index
    if logged_in?
      @total_memories = Memory.where(id: current_user.memories + current_user.addings)
      @memories = @total_memories.order(date: :desc).page(params[:page]).per(8)
    else
      gon.flickr_api_key = ENV['FLICKR_API_KEY']
    end
  end
end
