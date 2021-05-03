class RegionsController < ApplicationController::API
  before_action :fetch_region, only: [:update, :delete]
  
  def create
    @region = Region.new(permitted_params)
    authorize @region, :create?
  end

  def update
    authorize @region, :update?
    if @region.update(permitted_params)
      response json: { message: "The #{@region.title} region is successfully updated." }
    else
      response json: @region.errors.full_messages
    end
  end

  def destroy
    authorize @region, :destroy?
    if @region.destroy
      response json: { message: "The #{@region.title} is successfully deleted." }
    else
      response json: { message: "Something is wrong when deleting #{@region.title}." }
    end
  end


  private

  def fetch_region
    @region = Region.find(params[:id])
  end

  def permitted_params
    params.require(:region).permit(:title, :code, :currency, :tax_percentage)
  end
end