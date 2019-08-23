class ParksController < ApplicationController
  def index
    @state = State.find(params[:state_id])
    @parks = @state.parks
    json_response(@parks)
  end

  def create
    @state = State.find(params[:state_id])
    @park = @state.parks.create!(park_params)
    json_response(@park, :created)
  end

  def show
    @state = State.find(params[:state_id])
    @park = @state.parks.find(params[:id])
    json_response(@park)
  end

  def update
    @state = State.find(params[:state_id])
    @park = @state.parks.find(params[:id])
    if @park.update!(park_params)
      render status: :ok, json: {
        message: "This park has been successfully updated!"
      }
    end
  end

  def destroy
    @state = State.find(params[:state_id])
    @park = @state.parks.find(params[:id])
    if @park.destroy!
      render status: :ok, json: {
        message: "This park has been successfully destroyed!"
      }
    end
  end

  private
  def park_params
    params.permit(:name, :address, :city)
  end

end
