class SessionsController < ApplicationController
    helper_method :validates_user

    def new
    end

    def create
        user = User.find_by(name: params[:user][:name])
        if user
            validates_user(user)
        else 
            redirect_to login_path
        end
    end

    def destroy
        session.delete :user_id
        redirect_to "/"
    end

    def validates_user(user)
        if user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to login_path
        end
    end
    
end