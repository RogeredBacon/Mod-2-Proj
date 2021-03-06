class ApplicationController < ActionController::Base
    before_action :current_user
    helper_method  :authorize_user, :current_user

    def current_user
      if session[:user_id]
        User.find(session[:user_id])
    end
   end

 
    
    def authorize_user
        unless current_user
          flash[:notice] = "Sorry, you need to be logged in to access that feature"
          redirect_to new_session_path
        end
    end
   
end
