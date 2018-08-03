class SessionsController < ApplicationController
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  def new
    @user = User.new
    @users = User.all
    render layout: false
  end

  def create
    # if params[:user] # Conventional Login
    #   @user = User.find_by(username: params[:user][:username])
    #   if @user && @user.authenticate(params[:user][:password])
    #     session[:user_id] = @user.id
    #     redirect_to user_path(@user)
    #   else
    #     redirect_to signin_path, notice: "Login failed. Please try again."
    #   end
    # elsif auth['uid'] # Facebook Login
      @user = User.find_or_create_by(:uid => auth['uid']) do |u|
        u.username = auth['info']['name']
        u.image_url = auth['info']['image']
      end
      session[:user_id] = @user.try(:id)
      redirect_to user_path(@user)
    # end
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
