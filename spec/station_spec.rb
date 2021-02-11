require 'station.rb'

describe Station do

    it 'should respond to name' do
      station = Station.new("hatfield", 1)
      expect(station.name).to eq "hatfield"

    end

    it 'should respond to zone' do
        station = Station.new("hatfield", 1)
        expect(station.zone).to eq 1
    end
end

