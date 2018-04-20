require_relative './bike'

class DockingStation

  DEFAULT_CAPACITY = 20
  attr_reader :bikes
  attr_accessor :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    fail 'no bikes available' if empty?
    fail 'cannot relase as no working bikes available' unless working_bikes?
    release_working_bike
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
    @bikes.length == DEFAULT_CAPACITY
  end

  def working_bikes?
    @bikes.any? { |bike| bike.working? }
  end

  def release_working_bike
    @bikes.sort_by! { |bike| bike.working?.to_s }
    @bikes.pop
  end

end
