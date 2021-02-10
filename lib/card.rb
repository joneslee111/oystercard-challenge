class Oystercard 
  attr_reader :balance, :entry_station, :exit_station, :journey_log, :journey
  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @journey = { entry:nil, exit:nil }
    @journey_log = []
    
  end
  
  def in_journey?
    if @entry_station == nil
      return false
    else 
      true
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
    @entry_station = station
    @exit_station = nil
    @journey[:entry] = @entry_station
    
    end 
  
  def touch_out(station)
    deduct(MIN_BALANCE)
    @entry_station = nil
    @exit_station = station
    @journey[:exit] = @exit_station
    @journey_log << @journey
    @journey = { entry:nil, exit:nil }
  end 
 
private
  def deduct(amount)
    @balance -= amount
    return @balance
  end

end 
