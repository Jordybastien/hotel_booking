class HotelsController < ApplicationController
  def index
    # @pagy, @rooms = pagy((Room.all), items: 20)
    @rooms = Room.all
  end
end
