class AlbumsController < ApplicationController
  def index
    @memories = current_user.memories.order(date: :desc)
  end
end
