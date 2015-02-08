class PersonsController < ApplicationController
  def show
  	@user = current_user
  end

  def update
  	@user = current_user
    @user.avatar = params[:user][:avatar]
    @user.save!    
    redirect_to persons_path
  end

  def user_avatar
  	 params.permit[:user][:avatar]
  end
end
