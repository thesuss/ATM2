require 'Date'

class Account

  STANDARD_VALIDITY_YRS = 5

  attr_accessor :pin_code, :exp_date, :account_status, :owner, :balance

  def set_expire_date
    Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end

  def initialize(attrs = {})
    @pin_code = rand(1000..9999)
    @exp_date = set_expire_date
    @account_status = :active
    @owner = set_owner(attrs[:owner])
    @balance = 0
  end

  def deactivate
    @account_status = :deactivated
  end

  private
    def set_owner(obj)
    obj == nil ?  missing_owner : @owner = obj
  end

  def missing_owner
    raise "An Account owner is required"
  end
end
