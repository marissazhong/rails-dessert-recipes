class StaticPagesController < ApplicationController

  def home
    if logged_in?
      redirect_to user_path(current_user)
    else
      render layout: false
    end
  end

end
