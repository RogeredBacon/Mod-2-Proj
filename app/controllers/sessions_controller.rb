class SessionsController < ApplicationController

    def new
        
    end
    def create
      @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to users_path
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
