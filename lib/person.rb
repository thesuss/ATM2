class Person
  attr_accessor :name, :cash

  def initialize (attrs = {})
    @name =  set_name(attrs[:name])
    @cash = 0
  end


  private
    def set_name(obj)
    obj == nil ?  missing_name : @name = obj
  end

  def missing_name
    raise "A name is required"
  end


end
