class HotelsController < ApplicationController
  def index
    # @pagy, @rooms = pagy((Room.all), items: 20)
    # TODO: Add infinite pagination
    @rooms = Room.all
  end
end
