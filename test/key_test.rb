require_relative 'test_helper'
require "./lib/key"

class KeyTest < Minitest::Test

  def  test_it_exists
    random = Key.new

    assert_instance_of Key, random
  end

  def test_it_generates_number
    random = Key.new

    number = random
    assert number
  end

  def test_it_pads_with_zeros
    random = Key.new
    number = 345
    number = number.to_s.rjust(5, '0')

    assert_equal "00345", number
  end

end
