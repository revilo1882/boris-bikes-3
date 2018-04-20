require 'docking_station'

describe DockingStation do

  let(:bike) {Bike.new}

  describe '#dock(bike)' do

    it 'raises error if docking station is full' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock(bike) }
      expect { subject.dock(bike) }.to raise_error 'docking station is full'
    end

    it 'returns docked bikes' do
      subject.dock(bike)
      expect(subject.bikes).to eq [bike]
    end

    it 'docks something' do
      expect(subject.dock(bike)).to eq [bike]
    end

    it 'docks a broken bike' do
      bike.report_broken
      expect(subject.dock(bike)).to eq [bike]
    end

  end

  describe '#release_bike' do

    it 'releases a bike' do
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'returns a working bike' do
        subject.dock(bike)
        expect(subject.release_bike).to be_working
    end

    it 'raises error if no bikes available' do
        expect { subject.release_bike }.to raise_error 'no bikes available'
      end

      it "doesn't release bike if broken" do
        bike.report_broken
        subject.dock(bike)
        expect {subject.release_bike}.to raise_error 'cannot relase as no working bikes available'
      end

      it "only returns a working bike" do
        bike1 = Bike.new
        subject.dock(bike1)
        bike.report_broken
        subject.dock(bike)
        expect(subject.release_bike).to eq bike1
      end
  end

  describe 'capacity' do
    it 'set capacity to default value' do
      expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
    end
  end

end
