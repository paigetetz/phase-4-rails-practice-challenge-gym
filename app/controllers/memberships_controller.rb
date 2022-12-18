class MembershipsController < ApplicationController

    def index
        memberships = Membership.all
        render json: memberships
    end

    def create
        membership = Membership.create(membership_params)
        if membership.valid?
            render json: membership, status: :created
        else
            render json:{'errors': membership.errors.full_messages}, status: :unprocessable_entity
        end
    end

    private 
    def membership_params
        params.permit(:client_id, :gym_id, :charge)
    end
end
