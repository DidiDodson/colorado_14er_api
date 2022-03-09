class Api::V1::FourteenersController < ApplicationController
  def index
    render json: FourteenersSerializer.new(Fourteener.all)
  end

  def show
    if Fourteener.exists?(params[:id])
      render json: FourteenersSerializer.new(Fourteener.find(params[:id]))
    else
      render json: { errors: { details: "There was an error finding this mountain." } }, status: 404
    end
  end

  def update
    mountain = Fourteener.update(params[:id], fourteener_params)
    if mountain.save
      render json: FourteenersSerializer.new(mountain)
    else
      render json: { errors: { details: "There was an error updating this mountain's details." } }, status: 400
    end
  end

  private

  def fourteener_params
    params.permit(:arapahoe_name, :arapahoe_translation, :ute_name, :ute_translation, :elevation, :range, :county, :nearby_towns, :hiking_routes, :climate, :geology, :first_ascent, :history, :resources, :image, :map)
  end
end
