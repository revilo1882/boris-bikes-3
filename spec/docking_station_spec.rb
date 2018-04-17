require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to(:release_bike) }

  it 'returns a bike' do
    bike = subject.release_bike
    expect(bike).to be_an_instance_of(Bike)
  end

  context 'when bike is working' do
    it 'returns a working bike' do
      bike = subject.release_bike
      expect(bike).to be_working
  end

  end
end
