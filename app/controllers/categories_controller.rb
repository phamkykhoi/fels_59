class CategoriesController < ApplicationController
  def index
    @categories = Category.all.paginate page: params[:page], per_page: 5
  end

  def show
    @category = Category.find params[:id]
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find params[:id]
  end

  def create
    @category = Category.new category_params
    if  @category.save
      flash[:success] = I18n.t(:category_success_created)
      redirect_to categories_path
    else
      render "new"
    end
  end

  def update
    @category = Category.find params[:id]
    if @category.update category_params
      flash[:success] = I18n.t(:category_success_updated)
      redirect_to categories_path
    else
      render "edit"
    end
  end

  def destroy
    Category.find(params[:id]).destroy
    flash[:success] = I18n.t(:category_success_destroy)
    redirect_to categories_path
  end

  private
  def set_category
    @category = Category.find params[:id]
  end

  def category_params
    params.require(:category).permit :title
  end
end