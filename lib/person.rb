require 'atm.rb'
require 'account.rb'

class Person
  attr_accessor :name, :cash, :account

  def initialize (attrs = {})
    @name =  set_name(attrs[:name])
    @cash = 0
  end

#  before { subject.create_account }
#  it 'of Account class ' do
#    expect(subject.account).to be_an_instance_of Account
#  end
#  it 'with himself as an owner' do
#    expect(subject.account.owner).to be subject


  #detta kom jag inte på av mig själv, men lärde mig en hel del på vägen,
  def create_account
    #Var förstår/hittar man att det måste stå owner: self i parantesen? 
    @account = Account.new(owner: self)
  end

  private
    #samma som owner i account...
    def set_name(obj)
    obj == nil ?  missing_name : @name = obj
  end

  def missing_name
    raise "A name is required"
  end


end
