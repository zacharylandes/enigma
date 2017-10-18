require 'pry'
#
#
# index value  of code - index value of period = rotation at that index
# subtract rotation from the index value of code


require_relative 'key'
# require_relative 'today_date'
require 'date'


class Decryptor
  def initialize(string, key = Key.new, date = @date)
    @code = string.split('')
    @end_ary = [38,38,5,14,4,38,38]
    @key_guess = [0,0,0,0]
    @alpha_index = []
    @subtracted_offset = []
    @alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n',
      'o','p','q','r','s','t','u','v','w',
    'x','y','z','1','2','3','4','5','6','7','8','9','0',' ','.',',']
  end

  def code_to_index
    @code.each_with_index do |letter,index|
      @alphabet.each_with_index do |x,i|
         if @code[index] == @alphabet[i-1] %39
            @alpha_index << i
          end
         end
    end
  p  @alpha_index
  end
#
#
def find_rotation
  rot = []
  i = -1
 while i > -5
     rot << @alpha_index[i].to_i - @end_ary[i].to_i
  i-=1
# end
end
p  @rot = rot * @code.length
end
def subtract_rotation
  @final_index = []
  @alpha_index.reverse.each_with_index do  |x,i|
    @final_index << (x - @rot[i].to_i) %39
  end
  p @final_index
end
def convert_to_letters
  final = []
  @final_index.each_with_index do |letter,index|
    @alphabet.each_with_index do |x,i|
       if letter == i+1
          final << x
        end
       end
  end
p final = final.reverse.join

end
#   def subtract_offset
#     @alpha_index.each_with_index do |x,i|
#       num = (@alpha_index[i] - @rotations[i+1]) % 39
#       @subtracted_offset << num
#     end
#       @subtracted_offset
#
# end
#
#   def decrypt
#     @final_decryption = []
#      @subtracted_offset.each_with_index do |num, index|
#         @alphabet.each_with_index do |x,i|
#             if num % 39  == i+1
#               final_decryption << x
#             end
#           end
#     end
#     p  @final_decryption.join
# end
# def guess_again
#   if @final_decryption.join == "..end..."
#   else
# end end
#
# end
end


decrypt = Decryptor.new("wly34flv3klp")
# decrypt.key_guess
# decrypt.rotation
decrypt.code_to_index
decrypt.find_rotation
decrypt.subtract_rotation
decrypt.convert_to_letters
# decrypt.decrypt
