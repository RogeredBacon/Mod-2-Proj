class SessionsController < ApplicationController

    def new
        
    end

    def index
      session[:user_id] = nil
    end
    
    def create
      @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
        else
          flash[:notice] = "Sorry, we can't find a user with that username and password"
          redirect_to new_session_path
        end
    end

    
      def destroy
        session.destroy
        redirect_to new_session_path
      end
    
end



# def login
# end

# def authenticate
#   user = User.find_by(name: params['username'])
#   if !(user && user.authenticate(params['password']))
#     session[:user_id] = nil
#   else
#     puts 'you have logged in'
#     session[:user_id] = user.id
#     redirect_to new_answer_path
#   end
# end

# def logout
#   session.delete(:user_id)
#   redirect_to new_answer_path
# end