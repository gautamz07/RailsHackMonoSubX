class AddAirlineWorker
  include Sidekiq::Worker
  sidekiq_options retry: false

  # def perform(*params)
  #   puts params
  #   airline = Airline.new()
  #   airline[:name] = params[:name]
  #   airline.save!
  # end

  def perform(params={})
    params = params.to_h.transform_keys(&:to_sym)
    puts params
    airline = Airline.new(params)
    airline.save!
  end
end