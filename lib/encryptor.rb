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
    @added_offset = []
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

  def rotation
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
     @added_offset.push(@alpha_index[i] + @rotations[i])
   end
   @added_offset
  end

  def encrypt
    final_encryption = []
    @added_offset.each_with_index do |num, index|
        @alphabet.each_with_index do |x,i|
          if  num % 39 == i+1
                final_encryption <<  x
          end
        end
    end
     final_encryption.join
  end


end
