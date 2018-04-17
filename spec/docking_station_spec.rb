require 'docking_station'

describe DockingStation do
  it 'responds to release bike' do
    station = DockingStation.new
    expect(station).to respond_to(:release_bike)
  end
end
