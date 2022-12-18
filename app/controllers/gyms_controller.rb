class GymsController < ApplicationController

    def index
        gyms = Gym.all
        render json: gyms
    end

    def show
        gym = Gym.find_by_id(params[:id])
        if gym
            render json: gym
        else
            render json: {'error': 'Gym not found!'}, status: :not_found
        end
    end

    def create
        gym= Gym.create(gym_params)
        if gym.valid?
            render json: gym, status: :created
        else
            render json:{'errors': gym.errors.full_messages}, status: :unprocessable_entity
        end
    end

    def update
        gym = Gym.find_by_id(params[:id])
        if gym
            gym.update(gym_params)
            render json: gym
        else
            render json: { 'error': 'Gym not found!'}, status: :not_found
        end
    end

    def destroy
        gym = Gym.find_by_id(params[:id])
        if gym
            gym.destroy
            head :no_content
        else
            render json:{'error': 'Gym not found!'}, status: :not_found
        end
    end

    private
    
    def gym_params
        params.permit(:name, :address)
    end

end
