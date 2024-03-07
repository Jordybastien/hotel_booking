module Filterable
  extend ActiveSupport::Concern

  FILTER_PARAMS = [:arrival_date, :departure_date, :number_of_rooms, :price].freeze

  def filter_params
    params.fetch(:filter, {}).permit(*FILTER_PARAMS)
  end
end
