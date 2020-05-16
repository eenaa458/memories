class MemoriesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @memory = current_user.memories.build(memory_params)
    if @memory.save
      flash[:success] = 'メモリーを記録しました。'
      redirect_to root_url
    else
      @memories = current_user.memories.order(id: :desc)
      flash.now[:danger] = 'メモリーの記録に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @memory.destroy
    flash[:success] = 'メモリーを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def memory_params
    params.require(:memory).permit(:title, :content)
  end
  
  def correct_user
    @memory = current_user.memories.find_by(id: params[:id])
    unless @memory
      redirect_to root_url
    end
  end
end
