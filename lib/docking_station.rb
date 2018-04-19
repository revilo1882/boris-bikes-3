require_relative './bike'

class DockingStation

  attr_reader :bikes

def initialize
  @bikes = []
end

  def release_bike
    fail 'no bikes available' if @bikes.length == 0
    @bikes.pop
  end

  def dock(bike)
    fail 'docking station is full' if @bikes.length == 20
    @bikes << bike
  end

end
