# create a new  categories_controller in admins folder?
 #admin/category#create
 #
# implement def new and def index in categories controller
# create views/admin/categories directory
# create index.html.erb
  # textarea to input category names
  # contains a button that submits category name
  # option to add products into the category


class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['name'], password: ENV['password']
  

  def new
    @category = Category.new
  end

  def index
    @categories = Category.order(id: :desc).all
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to [:admin, :categories], notice: 'Category created!'
    else
      render :new
    end
  end
  def category_params
    params.require(:category).permit(
      :name,
    )
  end
end
