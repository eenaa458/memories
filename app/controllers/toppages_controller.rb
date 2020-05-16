class ToppagesController < ApplicationController
  def index
    if logged_in?
      @memory = current_user.memories.build  # form_with 用
      @memories = current_user.memories.order(id: :desc)
    end
  end
end
