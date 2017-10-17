require 'pry'

class Key
  attr_reader  :key

  def initialize(key = @key)
    # @random = randomize
   @key = rand(0...99999).to_s.rjust(5, '0').split('')
  end
  # def return_key
  #   @key.
  # end

end

#
# rando = Key.new
#   rando.instance_variable_get(:@key)
