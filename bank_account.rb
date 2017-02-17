require 'minitest'
require 'minitest/autorun'

class BankAccount
  def initialize
    @balance = 0
  end

  def deposit!(amount)
    increase_balance!(amount)
    self
  end

  def withdraw!(amount)
    if enough_money?(amount)
      reduce_balance!(amount)
    else
      raise StandardError, "not enough money on account"
    end

    self
  end

  def balance
    @balance
  end

  private

  def enough_money?(amount)
    balance >= amount
  end

  def increase_balance!(amount)
    @balance = @balance + amount
  end

  def reduce_balance!(amount)
    @balance = @balance - amount
  end

end

# in Java: class BankAcountTest extends minitest.Test

class BankAccountTest < Minitest::Test

  def test_it_decreases_the_balance_when_withdrawing_money
    account = BankAccount.new
    account.deposit!(100)
    account.withdraw!(49)
    assert_equal 51, account.balance
  end

end