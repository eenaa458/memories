class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :check_guest, only: [:update, :destroy]
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(25)
  end
  
  def show
    @user = User.find(params[:id])
    @total_memories = Memory.where(id: @user.memories + @user.addings)
    @memories = @total_memories.order(date: :desc).page(params[:page]).per(8)
    counts(@user)
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to root_url
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit
  end

  def update
  end
  
  def destroy
    @user.destroy
    flash[:success] = '退会しました。またのご利用お待ちしております。'
    redirect_back(fallback_location: root_path)
  end
  
  def followings
    @user = User.find(params[:id])
    @followings = @user.followings.page(params[:page])
    counts(@user)
  end
  
  def followers
    @user = User.find(params[:id])
    @followers = @user.followers.page(params[:page])
    counts(@user)
  end
  
  private
  
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
  
  def check_guest
    if @user.email == 'test@example.com'
      flash[:danger] = 'ゲストユーザーは編集・削除できません。'
      render :edit
    end
  end
end
