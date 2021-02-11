class Journey

    attr_reader :exit_station, :entry_station
  def initialize(entry = nil, exit = nil)
    @entry_station = entry
    @exit_station = exit
   
  end

  def exit(station)
    @exit_station = station
  end

end