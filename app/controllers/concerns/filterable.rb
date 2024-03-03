module Filterable
  extend ActiveSupport::Concern

  FILTER_PARAMS = [:arrival_date, :departure_date, :rooms_count, :price].freeze

  def filter_params
    params.fetch(:filter, {}).permit(*FILTER_PARAMS)
  end
end
