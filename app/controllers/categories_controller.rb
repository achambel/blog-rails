class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category, notice: I18n.t('views.defaults.notice.save')
    else
      render :new
    end
  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: I18n.t('views.defaults.notice.update')
    else
      render :edit
    end
  end

  def destroy
    @category.destroy
    redirect_to categories_path, notice: I18n.t('views.categories.notice_destroyed')
  end

  private
  def set_category
    @category = Category.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params.require(:category).permit(:name, :description)
  end

end
