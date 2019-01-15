class Oystercard

  attr_reader :balance, :Max_Balance, :in_journey

  def initialize(balance = 0, in_journey = false)
    @balance = balance
    @Max_Balance = 90
    @in_journey = in_journey
  end

  def top_up(amount)
    (@balance += amount) > @Max_Balance ? raise("Exceeded max balance of #{@Max_Balance}!") : @balance
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @in_journey = false
  end

  def touch_in
    @in_journey = true
  end

  def touch_out
    @in_journey = false
  end

end
