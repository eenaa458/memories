class ToppagesController < ApplicationController
  def index
    if logged_in?
      @memories = current_user.memories.order(date: :desc).page(params[:page]).per(8)
    end
  end
end
