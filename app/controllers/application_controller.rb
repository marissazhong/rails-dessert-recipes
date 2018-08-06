class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :current_user

  def logged_in?
    !!current_user
  end

  private
  
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    def set_user
        @user = current_user
    end

    def require_logged_in
      redirect_to root_path unless logged_in?
    end

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
end
