require_relative 'key'

class Date
  attr_reader :today

  def initialize
    @today = today
  end

  def generate_date
    @today = Time.now.strftime("%D").split("/").join('')
  end

  def make_into_integer
    date = generate_date
    date.to_i
  end

  def square_date
    square = make_into_integer
    square ** 2
  end

  def offset_numbers
    isolation = square_date
    isolation.digits.first(4).reverse
  end

  def add_key_rotations
    isolation = offset_numbers
    offset_a = offset_numbers[0]
  end

end

dmy = Date.new
puts dmy.add_key_rotations
