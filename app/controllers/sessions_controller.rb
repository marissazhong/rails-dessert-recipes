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
    if params[:user] # Conventional Login
      @user = User.find_by(username: params[:user][:username])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        redirect_to signin_path, notice: "Login failed. Please try again."
      end
    elsif auth['uid'] # Facebook Login
      @user = User.find_by(:uid => auth['uid'])
      if !@user # create new user 
        @user = User.new(:uid => auth['uid']) do |u|
          u.username = auth['info']['name']
          u.image_url = auth['info']['image']
        end
        @pantry = Pantry.create(user_id: @user.id)
        @user.pantry = @pantry
        @user.email = "facebook_user"
        @user.password_digest = "0"
        @user.save
      end
      session[:user_id] = @user.try(:id)
      redirect_to user_path(@user)
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
