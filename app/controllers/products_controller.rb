class ProductsController < ApplicationController
  def index
    @show = Show.where(id: params[:show_id])
    p '********************'
    p @show
  end
end
