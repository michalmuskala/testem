class Admin::UsersController < Admin::BaseController
  before_action :find_user, only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    if @user == current_user
      redirect_to admin_user_path(@user), alert: 'You cannot edit yourself, try editing your profile'
    else
      if @user.update(user_params)
        redirect_to admin_user_path(@user), notice: 'User updated.'
      else
        render 'edit'
      end
    end
  end

private
  
  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:admin)
  end
  
end