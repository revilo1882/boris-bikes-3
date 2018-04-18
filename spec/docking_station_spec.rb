require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to(:release_bike) }

  it { is_expected.to respond_to(:dock).with(1).argument }

  it 'returns a working bike' do
      #bike = subject.release_bike
      bike = Bike.new
      expect(bike).to be_working
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
<<<<<<< HEAD

=======
>>>>>>> a98cfdb528f3818227841ae0c7558beed382aa8c
  end

  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect((subject.release_bike)).to eq bike
    end
    it 'raises error if no bikes available' do
        expect { subject.release_bike }.to raise_error 'no bikes available'
      end
  end

end
