class Oystercard 
  attr_reader :balance
  MAX_BALANCE = 90
  MIN_BALANCE = 1

  def initialize
    @balance = 0
    @journey = false
  end
  
  def in_journey?
    @journey
  end
  
  def top_up(amount)
    fail 'ERROR: Cannot add. Balance will exceed #{MAX_BALANCE}' if @balance + amount > MAX_BALANCE
    @balance += amount 
    return @balance
  end 

  def touch_in
    fail 'Insufficient Balance' if @balance < MIN_BALANCE
    @journey = true
  end 
  
  def touch_out
    @journey = false
    deduct(MIN_BALANCE)
  end 

  def deduct(amount)
    @balance -= amount
    return @balance
  end

end 

