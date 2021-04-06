class UsersController < ApplicationController
  before_action :require_admin

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path, success:"ユーザーを登録しました"
    else
      flash.now[:danger] = '登録に失敗しました'
      render :new
    end
  end

  def index
    @user = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_path(@user), success: "ユーザー情報を更新しました"
    else
      flash.now[:danger] = '更新に失敗しました'
      render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, success: 'ユーザー情報を削除しました'
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end

  def require_admin
    redirect_to users_path unless current_user.admin?
  end
end
