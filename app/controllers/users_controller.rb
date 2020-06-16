class UsersController < ApplicationController
    
    def show
        @user = current_user
    end

    def new
        @user = User.new
    end

    def create
        user = User.new(user_params)
        if user.valid? && params[:user][:password] == params[:user][:password_confirmation]
            user.save
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            redirect_to signup_path
        end
    end

    private
 
    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end

end