class UsersController < ApplicationController
    before_action :require_logged_in, except: [:new, :create]
    before_action :check_user, only: [:show, :edit, :update, :destroy]
    before_action :all_recipes, only: [:show]

    # shows signup page
    def new
        @user = User.new
        render layout: false
    end
    
    # creates new user
    def create
        @user = User.new(user_params)
        if @user.save
            @pantry = Pantry.create(user_id: @user.id)
            @user.pantry = @pantry
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            render :new, layout: false
        end
    end

    # creates new user
    def create_fb_user
        @user = User.new(:uid => auth['uid']) do |u|
            u.username = auth['info']['name']
            u.image_url = auth['info']['image']
          end
          @pantry = Pantry.create(user_id: @user.id)
          @user.pantry = @pantry
          @user.email = "facebook_user"
          @user.password_digest = "0"
          @user.save
        session[:user_id] = @user.try(:id)
        redirect_to user_path(@user)
    end
    
    # shows user homepage
    def show
    end

    # shows edit user credentials page
    def edit
        if @user.email == "facebook_user"
            redirect_to user_path(@user)
        end
    end
  
    # updates user credentials
    def update
        if @user.update(user_params)
            redirect_to @user, notice: 'User was successfully updated.'
        else
            render :edit
        end
    end

    # deletes user
    def destroy
        @user.destroy
        redirect_to signout_path
    end

    private

    def check_user
        @user = User.find(params[:id])
        if @user != current_user
          redirect_to user_path(current_user)
        end
    end
    
    def all_recipes
        @recipes = Recipe.all
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end 

end
