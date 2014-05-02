class SessionsController < ApplicationController

    def create
        user = User.authenticate(params[:session][:email], params[:session][:password])

        if user.nil?
            flash.now[:error] = "Invalid email/password combination."
            render 'new'
        else
            session[:user_id] = user.id
            redirect_to user
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path
    end 
end