class FriendshipsController < ApplicationController
  def create
    @user = User.find(params[:followed_id])
    following = current_user.follow(@user)
    if following.save
      flash[:success] = 'success'
      redirect_to @user
    else
      flash[:alert] = 'failed'
      redirect_to @user
    end
  end

  def destroy
    @user = User.find(params[:followed_id])
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:success] = 'success'
      redirect_to @user
    else
      flash[:alert] = 'failed'
      redirect_to @user
    end
  end
end
