class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.authenticate(params[:email], params[:password])
    if user
      p 'does this even run though?'
      session[:user_id]= user.id
      redirect_to root_url, :notice => "Logged in!"


    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged Out!"
  end
end


#
# <%# if login is successful (user_signed_in?) then redirect move to posts path %>
