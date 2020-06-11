class ToppagesController < ApplicationController
  def index
    if logged_in?
      @memories = current_user.memories.order(date: :desc)
    end
  end
end
