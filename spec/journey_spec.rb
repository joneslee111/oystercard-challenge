require 'journey'

describe Journey do
    describe '#entry station' do
        it 'should equal station'do
          journey = Journey.new("entry")
          expect(journey.entry_station).to eq "entry"
        end
      end
    
      describe '#exit_station' do
        it 'should equal station' do
          journey = Journey.new("entry")
          journey.exit("exit")
          expect(journey.exit_station).to eq "exit"
        end
      end
end