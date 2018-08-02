class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    before_action :all_recipes, only: [:show]

    def new
        @user = User.new
        render layout: false
    end
    
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user), notice: "Welcome to Sweet Tooth Recipes!"
        else
            render :new, layout: false
        end
    end
    
    def show
    end

    def edit
    end
  
    def update
        if @user.update(user_params)
            redirect_to @user, notice: 'User was successfully updated.'
        else
            render :edit
        end
    end

    private

    def set_user
        @user = User.find(params[:id])
    end
    
    def all_recipes
        @recipes = Recipe.all
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end 

end
