class AddMemoriesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @memory = Memory.find(params[:memory_id])
    current_user.add(@memory)
    flash[:success] = 'メモリーを追加しました。'
    redirect_to root_url
  end

  def destroy
    @memory = Memory.find(params[:memory_id])
    current_user.not_add(@memory)
    flash[:success] = 'メモリーの追加を解除しました。'
    redirect_to root_url
  end
end
