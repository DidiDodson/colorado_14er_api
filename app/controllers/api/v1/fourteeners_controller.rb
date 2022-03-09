class Api::V1::FourteenersController < ApplicationController
  def index
    render json: FourteenersSerializer.new(Fourteener.all)
  end

  def show
    render json: FourteenersSerializer.new(Fourteener.find(params[:id]))
  end

  private

  def fourteener_params
    params.permit(:english_name)
  end
end
