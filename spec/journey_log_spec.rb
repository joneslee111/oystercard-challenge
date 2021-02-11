require 'journey_log'

describe Journeylog do

  let (:station) { double :station }
  let (:exit_station) { double :exit_station }

  it 'should start a journey with an entry station' do
    expect(subject.start(station)).to be_a Journey
  end

  it '#finish method shoud add exit station to the current journey' do
    subject.start(station)
    expect(subject.finish(exit_station).exit_station).to eq exit_station
  end

  it '#journeys should return a list of all previous journeys' do
    subject.start(station)
    subject.finish(exit_station)
    subject.start(exit_station)
    subject.finish(station)

    expect(subject.journeys).to eq [[station,exit_station],[exit_station,station]]
  end


end