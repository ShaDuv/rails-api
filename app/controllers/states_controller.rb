class StatesController < ApplicationController
  def index
      @states = State.all
      json_response @states
    end

    def show
      @state = State.find params[:id]
      json_response @state
    end

    def create
      @state = State.create! state_params
      json_response @state, :created
    end

    def update
      @state = State.find params[:id]
      if @state.update! state_params
        render status: :ok, json: {
          message: "State updated successfully!"
        }
      end
    end

    def destroy
      @state = State.find params[:id]
      if @state.destroy!
        render status: :ok, json: {
          message: "State destroyed successfully!"
        }
      end
    end

    private

    def state_params
      params.permit :name, :city, :country
    end


end
