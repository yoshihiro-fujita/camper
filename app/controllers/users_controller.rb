class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :edit, :update]
  def index
    @users = User.all
    @users = User.all.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.all.page(params[:page]).per(12)
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user), alert: "不正なアクセスです。"
    end
  end

  def update
   @user =  User.find(params[:id])
    if @user.update(user_params)
   redirect_to user_path(@user), notice: "ユーザー情報を更新しました。"
    else
      render :edit
    end
  end

  private
   def user_params
    params.require(:user).permit(:username, :email, :profile, :profile_image)
   end
end
