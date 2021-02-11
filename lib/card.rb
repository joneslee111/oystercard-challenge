class Oystercard 
  attr_reader :balance, :entry_station, :exit_station, :journey_log, :journey
  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    # @entry_station = nil
    # @exit_station = nil
    # @journey = { entry:nil, exit:nil }
    @journey_log = []
    
    
  end
  
  def in_journey?
    if @journey_log.last.exit_station == nil
      return true
    else 
      false
    end
    # !!entry_station
    
  end
  
  def top_up(amount)
    fail 'ERROR: Cannot add. Balance will exceed #{MAX_BALANCE}' if @balance + amount > MAX_BALANCE
    @balance += amount 
    return @balance
  end 

  def touch_in(station)
    fail 'Insufficient Balance' if @balance < MIN_BALANCE
   # @entry_station = station
   # @exit_station = nil
   # @journey[:entry] = @entry_station
    if journey_log.empty? || journey_log.last.exit_station != nil
      @journey_log << Journey.new(station, nil)
    else 
    deduct(MIN_BALANCE*6)
    fail 'PENALTY CHARGE OF £6 FOR MISSING STATION'

    end

    
    end 
  
  def touch_out(station)
    # @entry_station = nil
    # @exit_station = station
    # @journey[:exit] = @exit_station
    # @journey_log << @journey
    # @journey = { entry:nil, exit:nil }
    # @journey_log.last.exit(station)
    if journey_log.empty? || journey_log.last.exit_station == nil
       @journey_log.last.exit(station)
       deduct(MIN_BALANCE)
    else
      deduct(MIN_BALANCE*6)
      fail 'PENALTY CHARGE OF £6 FOR MISSING STATION' if @journey_log << Journey.new(nil, station)
       
    end
   end 
 
private
  def deduct(amount)
    @balance -= amount
    return @balance
  end

end 
