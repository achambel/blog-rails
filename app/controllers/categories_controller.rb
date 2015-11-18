class CategoriesController < ApplicationController
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
      redirect_to @category, notice: I18n.t('views.categories.notice_saved')
    else
      render :new
    end
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params.require(:category).permit(:name, :description)
  end

end
