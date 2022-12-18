class ClientsController < ApplicationController

    def index
        clients = Client.all
        render json: clients
    end

    def show
        client = Client.find_by_id(params[:id])
        if client
            render json: client
        else
            render json: { 'error': "Client not found" }, status: :not_found

        end
    end

    def update
        client = Client.find_by_id(params[:id])
        if client
            client.update(client_params)
            render json: client, status: :ok
        else
            render json: { 'error': "Client not found" }, status: :not_found
        end
    end

    private

    def client_params
        params.permit(:name, :age)
    end
end
