class Journey

    attr_reader :exit_station, :entry_station
  def initialize(entry = nil, exit = nil)
    @entry_station = entry
    @exit_station = exit
   
  end

  def exit(station)
    @exit_station = station
  end




 #fare method should return the minimum fare (for the moment), or the penalty fare of 6 if there was either no entry station or no exit station.


  # touch in + touch out
  # touch in + no touch out
end