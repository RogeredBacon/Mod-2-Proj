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
     user = User.new(user_params)
      # byebug
      if user.valid?
        user.save
        redirect_to user_path(user)
      else
        flash[:errors] = user.errors.full_messages
        redirect_to new_user_path
      end
    end

    private
    
    def user_params 
      params.require(:user).permit(:first_name, :last_name, :username , :password, admin?: false)
    end


end
