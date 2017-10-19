
class Key
  attr_reader  :key

  def initialize(key = @key)
   @key = rand(0...99999).to_s.rjust(5, '0')
  end

end
