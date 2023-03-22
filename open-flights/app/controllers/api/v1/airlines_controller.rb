include ActiveModel::Serialization

module Api
  module V1
    class AirlinesController < ApplicationController
      protect_from_forgery with: :null_session

      def index
        airlines = Airline.all

        render json: AirlineSerializer.new(airlines, options).serialized_json
      end

      def show
        airline = Airline.find_by(slug: params[:slug])

        render json: AirlineSerializer.new(airline, options).serialized_json
      end

      def create
        # airline = Airline.new(airlines_params)
        # AddEndangeredWorker.perform_async(csv_file)
        # if airline.save
        #   render json: AirlineSerializer.new(airline).serialized_json
        # else
        #   render json: {error: airline.errors.message}, status: 422
        # end
        # byebug
        job_status = AddAirlineWorker.perform_async(airlines_params.to_h)
        render json: { message: 'In Progress' }
      end

      def update
        airline = Airline.find_by(slug: params[:slug])
        if airline.update(airlines_params)
          render json: AirlineSerializer.new(airline, options).serialized_json
        else
          render json: {error: airline.errors.message}, status: 422
        end
      end

      def destroy
        airline = Airline.find_by(slug: params[:slug])

        if airline.destroy
          head :no_content
        else
          render json: { error: airline.errors.message }, status: 422
        end
      end

      private

      def airlines_params
        params.require(:airline).permit(:name)
      end

      def options
        @options ||= { include: %i[reviews] }
      end
    end
  end
end