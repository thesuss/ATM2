class Account
  #A Ruby constant is like a variable, except that its value is supposed to
  #remain constant for the duration of the program.
  STANDARD_VALIDITY_YRS = 5
  #Man sätter den såhär i stället för inuti koden där den t.ex. kan bli svårhittad ifall den behöver ändras.
  attr_accessor :exp_date

  def set_expire_date
    Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%y')
  end

  def initialize
    #sätter utgångsdatum till ovan när kontot/kortet skapas
    @exp_date = set_expire_date
  end

end
