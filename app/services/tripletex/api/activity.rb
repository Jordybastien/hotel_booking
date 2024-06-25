class Tripletex::Api::Activity
  class << self
    delegate :find, to: :new
  end

  def initialize
    @client = TripletexRubyClient::ActivityApi.new
  end

  def find(id)
    @client.get(id)
  end
end