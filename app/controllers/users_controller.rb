class UsersController < ApplicationController

    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        respond_to do |format|
            if @user.save
                session[:user_id] = @user.id
                format.html { redirect_to user_path(@user), notice: "Welcome to Sweet Tooth Recipes!" }
            else
                format.html { render :new }
            end
        end
    end
    
    def edit
    end
  
    def update
        respond_to do |format|
            if @user.update(user_params)
                format.html { redirect_to @user, notice: 'User was successfully updated.' }
            else
                format.html { render :edit }
            end
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end 

end
