class ToppagesController < ApplicationController
  def index
    if logged_in?
      @memories = current_user.memories.order(id: :desc)
    end
  end
end
