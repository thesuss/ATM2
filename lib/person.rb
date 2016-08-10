require 'atm.rb'
require 'account.rb'

class Person
  attr_accessor :name, :cash, :account, :deposit

  def initialize (attrs = {})
    @name =  set_name(attrs[:name])
    @cash = 0
  end

  #detta kom jag inte på av mig själv, men lärde mig en hel del på vägen,
  def create_account
    #owner: self beror på att account skapas mha attrs. Self är själva personen (namnet)
    @account = Account.new(owner: self)
  end

  # ungefär samma som om namnet/ägare saknas..
  def deposit(amount)
      @account == nil ?  missing_account : deposit_funds(amount)
    end

  def missing_account
    raise "No account present"
  end

  private
    #samma som owner i account...
    def set_name(obj)
    obj == nil ?  missing_name : @name = obj
  end

  def missing_name
    raise "A name is required"
  end

  def deposit_funds(amount)
    @cash -= amount
    @account.balance = @account.balance - amount
  end

end
