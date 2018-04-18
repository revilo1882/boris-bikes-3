require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to(:release_bike) }

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'returns a working bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to be_working
  end

  it { is_expected.to respond_to(:bike) }

  it 'docks something' do
    bike  = Bike.new
    expect(subject.dock(bike)).to eq bike
  end

  it 'returns docked bikes' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bike).to eq bike
  end

describe '#dock(bike)' do
  it 'raises error if docking station is full' do
    subject.dock(Bike.new)
    expect { subject.dock(Bike.new) }.to raise_error 'docking station is full'
  end
end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
    it 'raises error if no bikes available' do
        expect { subject.release_bike }.to raise_error 'no bikes available'
      end
  end

end
