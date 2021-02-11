class Oystercard 
  attr_reader :balance, :entry_station, :exit_station, :journey_log, :journey
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  PENALTY_FARE = MIN_BALANCE * 6

  def initialize
    @balance = 0
    @journey_log = []    
  end
  
  def in_journey?
    @journey_log.last.exit_station == nil
 end
  
  def top_up(amount)
    fail 'ERROR: Cannot add. Balance will exceed #{MAX_BALANCE}' if @balance + amount > MAX_BALANCE
    @balance += amount 
    return @balance
  end 

  def touch_in(station)
    fail 'Insufficient Balance' if @balance < MIN_BALANCE

    if journey_log.empty? || journey_log.last.exit_station != nil
      @journey_log << Journey.new(station, nil)
    else 
      deduct(PENALTY_FARE); fail 'PENALTY CHARGE OF £6 FOR MISSING STATION'
    end

    end 
  
  def touch_out(station)
   if journey_log.empty? || journey_log.last.exit_station != nil
    deduct(PENALTY_FARE); fail 'PENALTY CHARGE OF £6 FOR MISSING STATION' if @journey_log << Journey.new(nil, station)
    else
      @journey_log.last.exit(station)
       deduct(MIN_BALANCE)
    end
   end 
 
private
  def deduct(amount)
    @balance -= amount
    return @balance
  end

end 
