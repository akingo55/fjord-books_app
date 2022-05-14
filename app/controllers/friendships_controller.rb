class FriendshipsController < ApplicationController
  def create
    @user = User.find(params[:followed_id])
    following = current_user.follow(@user)
    if following.save
      flash[:success] = t('controllers.frinedships.notice_follow_successed')
      redirect_to @user
    else
      flash[:alert] = t('controllers.frinedships.notice_follow_failed')
      redirect_to @user
    end
  end

  def destroy
    @user = User.find(params[:followed_id])
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:success] = t('controllers.frinedships.notice_unfollow_successed')
      redirect_to @user
    else
      flash[:alert] = t('controllers.frinedships.notice_unfollow_failed')
      redirect_to @user
    end
  end
end
