# create a new  categories_controller in admins folder?
 #admin/category#create
 #
# implement def new and def index in categories controller
# create views/admin/categories directory
# create index.html.erb
  # textarea to input category names
  # contains a button that submits category name
  # option to add products into the category


class Admin::ProductsController < ApplicationController

  def index
    @products = Product.order(id: :desc).all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to [:admin, :products], notice: 'Product created!'
    else
      render :new
    end
  end

  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to [:admin, :products], notice: 'Product deleted!'
  end

  private

  def product_params
    params.require(:product).permit(
      :name,
      :description,
      :category_id,
      :quantity,
      :image,
      :price
    )
  end

end
