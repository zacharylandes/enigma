
require_relative 'key'
# require_relative 'today_date'
require 'date'


class Decryptor
  def initialize(string, key = Key.new, date = @date)
    @my_message = string.split('')
    @key =  "91382"
    @date = 151017
    @rotation = []
    @alpha_index = []
    @calculated_index = []
    @alpha_index_first = []
    @final_decryption = []
    @alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n',
      'o','p','q','r','s','t','u','v','w',
    'x','y','z','1','2','3','4','5','6','7','8','9','0',' ','.',',']
  end

  def find_last_four
      @last_four = (@date ** 2).to_s.split('').last(4).to_a
  end

  def rotation
    @last_four.each_with_index do |x,i|
    @rotation.push([@key[i],@key[i+1]].join.to_i + @last_four[i].to_i)
    end
    @rot_with_key = @rotation * @my_message.length
    @rotation
  end

  def code_to_index
    @my_message.each_with_index do |letter,index|
      @alphabet.each_with_index do |x,i|
          @alpha_index << i  if @my_message[index] == @alphabet[i-1]%39
      end
    end
    @alpha_index
  end

  def add_offset
     @alpha_index.each_with_index do |x,i|
     @calculated_index.push(@alpha_index[i] + @rot_with_key[i+1])
    end
  end

  def subtract_offset
    @alpha_index.each_with_index do |x,i|
      num = (@alpha_index[i] - @rot_with_key[i+1]) % 39
      @calculated_index << num
    end
  end

  def first_num
      @first_num = @alpha_index_first[0] - @rot_with_key[1] % 39
      @alphabet.each_with_index do |x,i|
        @final_decryption << x if @first_num == i+1
      end
  end

  def crypt
     @calculated_index.each_with_index do |num, index|
        @alphabet.each_with_index do |x,i|
          @final_decryption << x if num % 39  == i+1
        end
     end
       @final_decryption.join
   end
end


decrypt = Decryptor.new("hello..end..")
# decrypt.offset_key
decrypt.find_last_four
decrypt.rotation
decrypt.code_to_index
decrypt.add_offset
# decrypt.first_num
decrypt.crypt
