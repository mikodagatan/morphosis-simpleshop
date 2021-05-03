class RegionsController < ApplicationController
  before_action :set_region, only: [:update, :delete]

  def index
    render json: RegionBlueprint.render(Region.all)
  end
  
  def create
    @region = Region.new(permitted_params)
    authorize @region, :create?
    if @region.save
      render json: RegionBlueprint.render(@region)
    else
      render json: { errors: @region.errors }, status: :unprocessable_entity 
    end
  end

  def update
    authorize @region, :update?
    if @region.update(permitted_params)
      render json: RegionBlueprint.render(@region)
    else
      render json: { errors: @region.errors }, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @region, :destroy?
    if @region.destroy
      response json: RegionBlueprint.render(@region)
    else
      render json: { errors: @region.errors }, status: :unprocessable_entity
    end
  end


  private

  def set_region
    @region = Region.find(params[:id])
  end

  def permitted_params
    params.require(:region).permit(:title, :code, :currency, :tax_percentage)
  end
end