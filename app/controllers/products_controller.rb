class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  # Only allow a product of trusted parameters through.
  def product_params
    params.require(:product).permit(:name, :price, :description)
    # , :photo
  end
end