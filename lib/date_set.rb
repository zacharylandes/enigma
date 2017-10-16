# require_relative 'key'
 # require 'date'
class Today_Date
  attr_reader :date

  def initialize
    @date = Time.now.strftime("%D").split("/").join('').to_i
  end


  # def generate_date
  #   @today = Time.now.strftime("%D").split("/").join('')
  # end
  # #
  # def make_into_integer
  #   date = generate_date
  #   date.to_i
  # end

  # def square_date
  #   square = make_into_integer
  #   square ** 2
  # end
  #
  # def offset_numbers
  #   isolation = square_date
  #   @isolation = isolation.digits.first(4).reverse
  #    @isolation
  # end
  #
  # def add_key_rotations
  #   isolation = offset_numbers
  #   offset_a = offset_numbers
  # end

end
#
# dmy = Today_Date.new
# dmy.today
