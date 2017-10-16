require_relative 'key'
require_relative 'date_set'
require 'date'
# require_relative 'message'
require 'pry'

class Encryptor
  def initialize(string, key = Key.new, date = 101317)
    @string = string.split('')
    @key =  key.instance_variable_get(:@key).to_s
    @date = 101317
    @rotations = []
    @alpha_index = []
    @alpha = []
    @alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n',
      'o','p','q','r','s','t','u','v','w',
    'x','y','z','0','1','2','3','4','5','6','7','8','9',' ','.',',']

  end
  # def load (string)
  #   # binding.pry
  #   file = File.open(string, "r")
  #    while (@line = file.gets)
  #     p @string = @line.split('')
  #    end
  # end


  def key_date
      @date_last_four = (@date ** 2).to_s.split('').last(4).to_a
      @date_last_four.each_with_index do |x,i|
      @rotations.push([@key[i],@key[i+1]].join.to_i + @date_last_four[i].to_i)
    end
     @rotations = @rotations * @string.length
  end

  def string_to_index
    @string.each_with_index do |letter,index|
      @alphabet.each_with_index do |x,i|
         if @string[index] == @alphabet[i-1] % 39
            @alpha_index << i
         end
      end
    end
    @alpha_index
  end

  def add_offset
    @alpha_index.each_with_index do |x,i|
     @alpha.push(@alpha_index[i] + @rotations[i])
   end
   @alpha
  end

  def encrypt
    final_encryption = []
    @alpha.each_with_index do |num, index|
        @alphabet.each_with_index do |x,i|
          if  num % 39 == i+1
                final_encryption <<  x
        else
          # p num
        end
      end
    end
     p final_encryption.join
  end


end


encrypt = Encryptor.new("hello")
# encrypt.load('message.txt')
encrypt.key_date
encrypt.string_to_index
encrypt.add_offset
encrypt.encrypt

#   if @string[index] == @alphabet[i-1]
#     p alpha_index << @rotation_b = @rotation_b + i % 26
#      return
#    end
# if @string[index] == @alphabet[i-1]
#   p alpha_index << @rotation_c = @rotation_c + i % 26
#    return
#  end
# if @string[index] == @alphabet[i-1]
#   p alpha_index << @rotation_d = @rotation_d + i % 26
#    return
#   end

# @string.each_with_index do |num, index|
# @alphabet.each_with_index do |x,i|
#   if @string[index] == @alphabet[i-1]
#      p alpha_index << @rotation_b = @rotation_b + i % 26
#   end
# end
# end
# @string.each_with_index do |num, index|
# @alphabet.each_with_index do |x,i|
#   if @string[index] == @alphabet[i-1]
#      p @rotation_b = @rotation_b + i % 26
#   end
# end
# end
# @string.each_with_index do |num, index|
# @alphabet.each_with_index do |x,i|
#   if @string[index] == @alphabet[i-1]
#      p @rotation_c = @rotation_c + i % 26
#   end
# end
# end
# @string.each_with_index do |num, index|
# @alphabet.each_with_index do |x,i|
#   if @string[index] == @alphabet[i-1]
#      p @rotation_d = @rotation_d + i % 26
#   end
# end
# end

  # @alphabet.each_with_index do |x,i|
  #   if @string[1] == @alphabet[i-1]
  #     p @alphabet[i-1+@rotation_b]
  #   end
  #     end
  #   @alphabet.each_with_index do |x,i|
  #     if @string[2] == @alphabet[i-1]
  #       p @alphabet[i-1+@rotation_c]
  #     end
  #       end
  # @alphabet.each_with_index do |x,i|
  #   if @string[3] == @alphabet[i-1]
  #     p @alphabet[i-1+@rotation_d]
  #   end
  #     end
  # @alphabet.each_with_index do |x,i|
  #   if @string[4] == @alphabet[i-1]
  #     p @alphabet[i-1+@rotation_a]
  #   end
  #     end
  # end


#    @offset
#    key_rot_a = @offset[0].to_i
#     offset_rot_a = @key.to_s.split('').first(2).join('').to_i
#     p  key_rot_a + offset_rot_a
# enddef rot_a
#    @offset
#    key_rot_a = @offset[0].to_i
#     offset_rot_a = @key.to_s.split('').first(2).join('').to_i
#     p  key_rot_a + offset_rot_a
# end
