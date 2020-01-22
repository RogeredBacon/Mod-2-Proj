class UsersController < ApplicationController

  def admin
    authorize_user
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit 
    @user = User.find(params[:id])
  end

  def create 
    user = User.new(params[:id])
      if user.valid?
        redirect_to users_path
      else
        redirect_to new_user_path
      end
    end

    private
    
    def user_params 
      params.require(:user).permit(:first_name, :last_name, :username , :password, :admin)
    end


end
