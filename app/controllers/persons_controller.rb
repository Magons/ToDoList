class PersonsController < ApplicationController
  def show
  	@user = current_user
  end

  def update
  	@user = current_user
    @user.avatar = user_avatar_params[:avatar]
    @user.save!    
    redirect_to persons_path
  end

  def user_avatar_params
  	 params.require(:user).permit(:avatar)
  end
end
