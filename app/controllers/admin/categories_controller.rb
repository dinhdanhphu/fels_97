class Admin::CategoriesController < ApplicationController

  def index
    @categories = Category.order :name
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:notice] = I18n.t "admin.category.create"
      redirect_to admin_categories_path
    else
      render "new"
    end
  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    @category = Category.find params[:id]
    if @category.update_attributes params[:id]
      flash[:notice] = I18n.t "admin.category.update"
      redirect_to admin_categories_path
    else
      render "edit"
    end
  end

  def delete
    @category = Category.find params[:id]
  end

  def destroy
    @category = Category.find params[:id].destroy
    flash[:notice] = I18n.t "admin.category.destroy"
    redirect_to admin_categories_path
  end

  def category_params
    params.require(:category).permit :name, :description
  end
end
