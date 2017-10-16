require 'pry'

class Key
  attr_reader  :key

  def initialize(key = @key)
    # @random = randomize
   @key =  rand(0...50000).to_s.rjust(5, '0').to_i
  end

end

#
# rando = Key.new
#   rando.instance_variable_get(:@key)
