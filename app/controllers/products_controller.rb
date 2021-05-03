class ProductsController < ApplicationController
  before_action :set_product, only: [:update, :destroy]

  def create
    @product = Product.new(permitted_params)
    authorize @product, :create?

    if @product.save
      render json: ProductBlueprint.render(@product)
    else
      render json: { errors: @product.errors }, status: :unprocessable_entity
    end
  end

  def update
    authorize @product, :update?

    if @product.update
      render json: ProductBlueprint.render(@product)
    else
      render json: { errors: @product.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @product, :destroy?

    if @product.destroy
      render json: ProductBlueprint.render(@product)
    else
      render json: { errors: @product.errors }, status: :unprocessable_entity
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def permitted_params
    params.require(:product).permit(:title, :description, 
      :image, :price, :sku, :stock, :region_id)
  end
end