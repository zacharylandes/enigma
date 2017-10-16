require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require "../lib/today_date"

class Today_DateTest < Minitest::Test

  def test_it_exsits
    day_month_year = Today_Date.new
    assert_instance_of Today_Date, day_month_year
  end

  def test_it_generates_todays_date
    dmy = Today_Date.new

    # date = Time.now.strftime("%D").split("/").join('')

    assert_equal 101617, dmy.date
  end
  #
  # def test_it_turns_date_into_integer
  #   dmy = Date.new
  #
  #   date = ("121519")
  #   make_into_integer = date.to_i
  #
  #   assert_equal 121519, make_into_integer
  # end
  #
  # def test_it_can_be_squared
  #   dmy = Date.new
  #
  #   date = 101417
  #   square_date = date ** 2
  #
  #   assert_equal 10285407889, square_date
  # end
  #
  # def test_it_can_grab_last_four_digits
  #   dmy = Date.new
  #
  #   offset = 10285407889
  #   offset = number.digits.first(4).reverse
  #
  #   assert_equal [7, 8, 8, 9], offset
  # end


end
