class CommentsController < ApplicationController
  before_action :get_post, only: [:create, :destroy]

  def create
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.js {}
        format.json { render json: @comment, status: :ok }
      else
        format.js {}
        format.json { render json: @comment, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    if @comment.user == current_user
      @comment.destroy
      redirect_to post_path(@post), flash: { success: I18n.t('views.defaults.crud.destroy') }
    else
      redirect_to post_path(@post), flash: { error: I18n.t('views.comments.no_allow_destroy') }
    end

  end

  private
  def get_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
