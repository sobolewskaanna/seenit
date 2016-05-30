class ProductsController < ApplicationController

  def index
    @show = Show.where(id: params[:show_id])
    @products = Product.where(show_id: params[:show_id])
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.create(product_params)
    @product.show_id = params[:show_id]
    if @product.save
      redirect_to show_products_path
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    @product.update_attributes(product_params)
    redirect_to show_products_path(@product.show_id)
  end

  def product_params
    params.require(:product).permit(:description, :image_url, :store_url)
  end

end
