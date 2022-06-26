# frozen_string_literal: true

class CommentsController < ApplicationController
  def show
    @comment = @commentable.comments.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.build(comment_params)
    if @comment.save
      redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      render :new
    end
  end

  def edit
    @comment = @commentable.comments.find(params[:id])
  end

  def update
    @comment = @commentable.comments.find(params[:id])
    redirect_to @commentable unless current_user.id == @comment.user_id

    if @comment.update(comment_params)
      redirect_to @commentable, notice: t('controllers.common.notice_update', name: Comment.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @comment = @commentable.comments.find(params[:id])
    redirect_to @commentable unless current_user.id == @comment.user_id

    if @comment.destroy
      redirect_to @commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
    else
      redirect_to @commentable
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id)
  end
end
