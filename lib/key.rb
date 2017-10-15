require 'pry'

class Key
  attr_reader :random

  def initialize
    @random = randomize
  end

  def randomize
    rand(0...50000).to_s.rjust(5, '0')
  end

  def change_to_array(change = @random)
    change.split('')
  end

   def key_rotation_a
    foo = change_to_array
    foo[0] + foo[1]
   end

  def key_rotation_b
    foo = change_to_array
    foo[1] + foo[2]
  end

  def key_rotation_c
    foo = change_to_array
    foo[2] + foo[3]
  end

  def key_rotation_d
    foo = change_to_array
    foo[3] + foo[4]
  end
end

rando = Key.new
 puts rando.key_rotation_a
 puts rando.key_rotation_b
 puts rando.key_rotation_c
 puts rando.key_rotation_d
