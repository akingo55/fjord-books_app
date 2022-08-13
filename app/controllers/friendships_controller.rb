# frozen_string_literal: true

class FriendshipsController < ApplicationController
  def create
    @user = User.find(params[:followed_id])
    if current_user.follow(@user)
      flash[:notice] = t('controllers.friendships.notice_follow_successed')
    else
      flash[:alert] = t('controllers.friendships.notice_follow_failed')
    end
    redirect_to @user
  end

  def destroy
    @user = User.find(params[:followed_id])
    if current_user.unfollow(@user)
      flash[:notice] = t('controllers.friendships.notice_unfollow_successed')
    else
      flash[:alert] = t('controllers.friendships.notice_unfollow_failed')
    end
    redirect_to @user
  end
end
