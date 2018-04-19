require_relative './bike'

class DockingStation

  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'no bikes available' if empty?
    @bikes.pop
  end


  def dock(bike)
    fail 'docking station is full' if full?
    @bikes << bike
  end

  private
  def empty?
    @bikes.length == 0
  end

  def full?
    @bikes.length == 20
  end

end
