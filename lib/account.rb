class Account


  #A Ruby constant is like a variable, except that its value is supposed to
  #remain constant for the duration of the program.
  STANDARD_VALIDITY_YRS = 5
  #Man sätter den såhär i stället för inuti koden där den t.ex. kan bli svårhittad ifall den behöver ändras.
  attr_accessor :pin_code, :exp_date, :account_status, :owner

  def set_expire_date
    Date.today.next_year(STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end

  def initialize(attrs = {})
    @pin_code = rand(1000..9999)
    #sätter utgångsdatum till ovan när kontot/kortet skapas
    @exp_date = set_expire_date
    @account_status = :active
    #owner från ovan får attribut från låtsasklassen i rspec
    @owner = set_owner(attrs[:owner])
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
