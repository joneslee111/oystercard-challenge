require 'journey'

class Journeylog

  def initialize
    @log = []
  end

  def start(station)
    @log << Journey.new(station)
    current_journey
  end

  def finish(station)
    current_journey.exit(station)
    current_journey
  end

  def journeys
    @log.map { |journey| [journey.entry_station, journey.exit_station] }
  end

  private 

  def current_journey
    @log.last
  end

end