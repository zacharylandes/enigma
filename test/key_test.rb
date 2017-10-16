require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require "./key"

class KeyTest < Minitest::Test

  def  test_it_exists
    rando = Key.new

    assert_instance_of Key , rando
  end

  def test_it_generates_number
    rando = Key.new

    number = rand(0...50000)

    assert number
  end

  def test_it_pads_with_zeros
    rando = Key.new

    number = 345
    number = number.to_s.rjust(5, '0')

    assert_equal "00345", number
  end

  def test_it_can_take_first_2_digits
    rando = Key.new

    number = "56790"
    key_rotation_a = number[0] + number[1]

    assert_equal "56", key_rotation_a
  end

  def test_it_can_take_second_and_third
    rando = Key.new

    number = "20485"
    key_rotation_b = number[1] + number[2]

    assert_equal "04", key_rotation_b
  end

  def test_it_can_take_third_and_fourth
    rando = Key.new

    number = "49538"
    key_rotation_c = number[2] + number[3]

    assert_equal "53", key_rotation_c
  end

  def test_it_can_take_fourth_and_fifth
    rando = Key.new

    number ="08933"
    key_rotation_d = number[3] + number[4]

    assert_equal "33", key_rotation_d
  end

end
