require 'docking_station'

#class MockWorkingBike
#  def working?
#    true
#  end
#end

#class MockBrokenBike
#  def working?
#    false
#  end
#end

describe DockingStation do

  let(:working) { double :working_bike, working?: true }
  let(:broken) { double :broken_bike, working?: false }

  describe '#working_bike_count' do
    context '1 working bike' do
      it "returns 1" do
        bikes = []
        bikes << working
        docking_station = DockingStation.new(bikes)

        expect(docking_station.working_bike_count).to eq(1)
      end
    end

    context '1 working bike, 1 broken bike' do
      it "returns 1" do
        bikes = []
        bikes << working
        bikes << broken
        docking_station = DockingStation.new(bikes)

        expect(docking_station.working_bike_count).to eq(1)
      end
    end
  end

  describe '#random_bike_working?' do
    context 'random bike is working' do
      it 'returns true' do
        working_bike = working
        broken_bike = broken

        docking_station = DockingStation.new([working_bike, broken_bike])

        expect(docking_station.random_bike_working?).to eq(true)
      end
    end

    context 'random bike is broken' do
      it 'returns false' do
        working_bike = working
        broken_bike = broken

        docking_station = DockingStation.new([working_bike, broken_bike])

        expect(docking_station.random_bike_working?).to eq(false)
      end
    end
  end
end
