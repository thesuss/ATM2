require './lib/atm.rb'
require './lib/account.rb'

class Person
  attr_accessor :name, :cash, :account, :deposit

  def initialize (attrs = {})
    @name =  set_name(attrs[:name])
    @cash = 0
  end

  def create_account
    @account = Account.new(owner: self)
  end

  def deposit(amount)
      @account == nil ?  missing_account : deposit_funds(amount)
  end

  def withdraw(args = {})
     @account == nil ? missing_account : withdraw_funds(args)
  end

  private

  def set_name(obj)
    obj == nil ?  missing_name : @name = obj
  end

  def deposit_funds(amount)
    @cash -= amount
    @account.balance = @account.balance + amount
  end

  def withdraw_funds(args)
    args[:atm] == nil ? missing_atm : atm = args[:atm]
    account = @account
    amount = args[:amount]
    pin = args[:pin]
    response = atm.withdraw(amount, pin, account)
    response[:status] == true ? increase_cash(response) : response
  end

  def increase_cash(response)
    @cash += response[:amount]
  end

  def missing_account
    raise "No account present"
  end

  def missing_name
    raise "A name is required"
  end

  def missing_atm
    raise "An ATM is required"
  end
end
