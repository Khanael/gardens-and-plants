class PlantsController < ApplicationController
  def create
    @garden = Garden.find(params[:garden_id])
    @plant = Plant.new(plant_params)
    @plant.garden = @garden

    if @plant.save
      redirect_to garden_path(@garden)
    else
      render "gardens/show", status: :unprocessable_entity
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    if @plant.destroy
      redirect_to "/gardens/show", status: :see_other
    else
      render "gardens/show"
    end
  end

  private

  def plant_params
    params.require(:plant).permit(:image_url, :name)
  end
end
