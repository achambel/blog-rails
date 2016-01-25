class CommentsController < ApplicationController
  before_action :get_post, only: [:create, :update, :destroy]

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to post_path(@post), flash: { sucess: I18n.t('views.defaults.crud.save') }
    else
      render :new
    end
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @comment.post, flash: { sucess: I18n.t('views.defaults.crud.update') }
    else
      render :edit
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post), flash: { warning: I18n.t('views.defaults.crud.destroy') }
  end

  private
  def get_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :user_id, :post_id)
  end
end
