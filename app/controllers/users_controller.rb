class UsersController < ApplicationController
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "ユーザー情報を編集しました！"
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, danger:"削除しました！"
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :image, :image_cache, :password,
                                 :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def ensure_correct_user
    @user = User.find_by(id:params[:id])
    if @user.id != current_user.id
      redirect_to users_path, danger:"権限がありません"
    end
  end
end
