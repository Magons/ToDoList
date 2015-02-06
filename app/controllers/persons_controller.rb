class PersonsController < ApplicationController
  def profile
  	@user = current_user
  end

  def update
  	@user = current_user
    @user.avatar = params[:user][:avatar]
    @user.save! 
     
    redirect_to me_path
  end
end
