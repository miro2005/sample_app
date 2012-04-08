class SessionsController < ApplicationController

  def new
    @title = "Sign in"
  end

  def create
    user = User.authenticate(params[:session][:email],
                             params[:session][:password])
                             
    remember = params[:remember]
                             
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    else
      # Sign the user in and redirect to the user's show page.
      # Remember Me is checked - permanent sign in else log out when browseris closed
      @last_login = user.currentlogin
      user.update_attributes(:password => params[:session][:password], 
                              :lastlogin => @last_login)
      user.update_attributes(:password => params[:session][:password], 
                              :currentlogin => 0.years.from_now)                             
                              
      if(remember == "True")
        sign_in user
      else
        sign_in_temp user
      end
      redirect_to user
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
end
