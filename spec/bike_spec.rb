require 'bike'

describe Bike do
  it { is_expected.to respond_to :working? }

  describe '#initialize' do

    it 'initialize is a working bike' do
      expect(subject.working?).to eq true
    end
  end

  describe '#working?' do
    it 'returns false is bike not working' do
      subject.report_broken
      expect(subject.working?).to eq false
    end
  end
end
