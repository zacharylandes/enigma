require_relative 'test_helper'
require './lib/crack'

class CrackTest < Minitest::Test
  
  def test_it_receives_a_message
    my_message = "a23pnl1unf"
    crack = Crack.new("a23pnl1unf")
    assert_equal ["a", "2", "3", "p", "n", "l", "1", "u", "n", "f"] , crack.my_message
  end

  def test_it_can_get_index_letters
    crack = Crack.new("a23pnl1unf")
    indeces = [1, 28, 29, 16, 14, 12, 27, 21, 14, 6]
    assert_equal indeces , crack.code_to_index
  end

  def test_it_can_find_the_rotation
    rotations = [-32, -24, 17, 13, -32, -24, 17, 13, -32,
       -24, 17, 13, -32, -24, 17, 13, -32, -24, 17, 13, -32,
        -24, 17, 13, -32, -24, 17, 13, -32, -24, 17, 13, -32,
         -24, 17, 13, -32, -24, 17, 13]
    crack = Crack.new("a23pnl1unf")
    crack.code_to_index

    assert_equal rotations, crack.find_rotation
  end

  def test_it_can_subtract_the_rotations
    final_index = [38, 38, 4, 14, 5, 38, 38, 16, 21, 25]
    crack = Crack.new("a23pnl1unf")
    crack.code_to_index
    crack.find_rotation

    assert_equal final_index, crack.subtract_rotation
  end

  def test_it_can_crack!
    crack = Crack.new("fdzuwptn7r2uxbt43bn")
    crack.code_to_index
    crack.find_rotation
    crack.subtract_rotation

    assert_equal "take me home..end..", crack.convert_to_letters
  end

end
