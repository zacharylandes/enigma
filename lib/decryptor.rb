
require_relative 'key'
# require_relative 'today_date'
require 'date'


class Decryptor
  def initialize(string, key = Key.new, date = @date)
    @code = string.split('')
    @key =  "91382"
    @date = 151017
    @rotations = []
    @alpha_index = []
    @subtracted_offset = []
    @alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n',
      'o','p','q','r','s','t','u','v','w',
    'x','y','z','1','2','3','4','5','6','7','8','9','0',' ','.',',']
  end

  def rotation
     @key
      @date_last_four = (@date ** 2).to_s.split('').last(4).to_a
      @date_last_four.each_with_index do |x,i|
      @rotations.push([@key[i],@key[i+1]].join.to_i + @date_last_four[i].to_i)
    end
    p @rotations = @rotations*@code.length
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

  def subtract_offset
    i =0
    @alpha_index.each_with_index do |x,i|
    num = ( @alpha_index[i] - @rotations[i+1])
    @subtracted_offset << num % 39
    end
  p  @subtracted_offset
  end

  def decrypt
    final_decryption = []
     @subtracted_offset.each_with_index do |num, index|
        @alphabet.each_with_index do |x,i|
          if num == 0
                final_decryption << x
          elsif  num % 39  == i+1
            final_decryption << x
        end
      end
    end
    p  final_decryption.join
  end
end


decrypt = Decryptor.new("0yv5veovteakcdkz8e7yteov81")
# decrypt.offset_key
decrypt.rotation
decrypt.code_to_index
decrypt.subtract_offset
decrypt.decrypt
