class Oystercard

  attr_reader :balance, :Max_Balance

  def initialize(balance = 0)
    @balance = balance
    @Max_Balance = 90
  end

  def top_up(amount)
    (@balance += amount) > @Max_Balance ? raise("Exceeded max balance of #{@Max_Balance}!") : @balance
  end

  def deduct(amount)
    @balance -= amount
  end

end
