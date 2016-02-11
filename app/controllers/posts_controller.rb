class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :require_logged_user, except: [:index, :show]

  def index
    if params[:category_id]
      @posts = Category.find(params[:category_id]).posts.page params[:page]
    elsif params[:user_id]
      @posts = User.find(params[:user_id]).posts.page params[:page]
    else
      @posts = Post.all.page params[:page]
    end
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post, flash: { success: I18n.t('views.defaults.crud.save') }
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, flash: { success: I18n.t('views.defaults.crud.update') }
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, flash: { warning: I18n.t('views.defaults.crud.destroy') }
  end

  def preview
    @preview = RDiscount.new(params[:content]).to_html
    respond_to do |format|
      format.json { render json: @preview }
    end
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end
  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:title, :content, :category_id)
  end
end
