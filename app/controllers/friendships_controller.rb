# frozen_string_literal: true

class FriendshipsController < ApplicationController
  def create
    @user = User.find(params[:followed_id])
    following = current_user.follow(@user)
    if following.save
      flash[:success] = t('controllers.frinedships.notice_follow_successed')
    else
      flash[:alert] = t('controllers.frinedships.notice_follow_failed')
    end
    redirect_to @user
  end

  def destroy
    @user = User.find(params[:followed_id])
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:success] = t('controllers.frinedships.notice_unfollow_successed')
    else
      flash[:alert] = t('controllers.frinedships.notice_unfollow_failed')
    end
    redirect_to @user
  end
end
