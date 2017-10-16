
require_relative 'key'
require_relative 'date_set'
require 'date'


class Decryptor
  def initialize(string, key = Key.new, date = 101317)
    @code = string.split('')
    @key =  key.instance_variable_get(:@key).to_s
    @date = 101317
    @rotations = []
    @alpha_index = []
    @alpha = []
    @alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n',
      'o','p','q','r','s','t','u','v','w',
    'x','y','z','0','1','2','3','4','5','6','7','8','9',' ','.',',']
  end

  def key_date
      @date_last_four = (@date ** 2).to_s.split('').last(4).to_a
      @date_last_four.each_with_index do |x,i|
      @rotations.push([@key[i],@key[i+1]].join.to_i + @date_last_four[i].to_i)
    end
    @rotations = @rotations*@code.length
  end

  def code_to_index
    @code.each_with_index do |letter,index|
      @alphabet.each_with_index do |x,i|
         if @code[index] == @alphabet[i-1] %39
            @alpha_index << i
         end
      end
    end
     @alpha_index

  end

  def subtract_offset
    @alpha_index.each_with_index do |x,i|
   num = ( @alpha_index[i] - @rotations[i])
      num = (39 - num) if num < 0
    @alpha << num
 end
  @alpha
  end

  def decrypt
    final_decryption = []
    @alpha.each_with_index do |num, index|
        @alphabet.each_with_index do |x,i|
          if  num % 27 == i+1
                final_decryption << x
        else

        end
      end
    end
     final_decryption.join
  end
end


decrypt = Decryptor.new("x5o04")
# decrypt.offset_key
decrypt.key_date
decrypt.code_to_index
decrypt.subtract_offset
decrypt.decrypt
