class MemoriesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:edit, :update, :destroy]
  
  def new
    @memory = current_user.memories.build
    @memory.memory_images.build
  end
  
  def create
    @memory = current_user.memories.build(memory_params)
    
    if @memory.save
      flash[:success] = 'メモリーを記録しました。'
      
      params[:memory_images]['image'].each do |img|
        @memory_images = @memory.memory_images.create(:image => img)
      end
      
      redirect_to root_url
    else
      @memories = current_user.memories.order(date: :desc).page(params[:page]).per(8)
      flash.now[:danger] = 'メモリーの記録に失敗しました。'
      render 'toppages/index'
    end
  end
  
  def edit
    tmp_memory = Memory.new(date: @memory.date, title: @memory.title, content: @memory.content)
    tmp_memory.memory_images.build
    @memory = tmp_memory
    @memory_id = params[:id]
  end
  
  def update
    if @memory.update(memory_params)
      flash[:success] = 'メモリーは正常に更新されました'
      redirect_to root_url
    else
      flash.now[:danger] = 'メモリーは更新されませんでした'
      render :edit
    end
  end

  def destroy
    @memory.destroy
    flash[:success] = 'メモリーを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def memory_params
    params.require(:memory).permit(:title, :content, :date, memory_images_attributes: [:id, :memory_id, :image, :_destroy])
  end
  
  def correct_user
    @memory = current_user.memories.find_by(id: params[:id])
    unless @memory
      redirect_to root_url
    end
  end
end
