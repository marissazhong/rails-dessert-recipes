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
    
    if params[:user][:username] # Conventional Login
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to signin_path, notice: "Login failed. Please try again."
      end
    elsif auth['fb_uid'] # Facebook Login
        @user = User.find_or_create_by(uid: auth['fb_uid']) do |u|
          u.name = auth['info']['fb_name']
          u.email = auth['info']['fb_email']
          u.image = auth['info']['fb_image']
        end
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
