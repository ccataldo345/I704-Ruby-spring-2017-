class BankAccount00
  def deposit(amount)
  end

  def withdraw(amount)
    if enough_money?(amount)
      reduce_balance(amount)
    else
      raise StandardError, "not enough money on account"
    end
  end

  def enough_money?(amount)
    balance >= amount
  end

  def balance
    0
  end

  def reduce_balance(amount)
    @balance = @balance - amount
  end

end
account = BankAccount00.new
account.deposit(100)
account.withdraw(50)
