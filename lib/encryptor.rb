require_relative 'key'
# require_relative 'today_date'
require 'date'
# require_relative 'message'
require 'pry'
class Encryptor
  attr_reader :date, :key

  def initialize(my_message, key = Key.new, date = @date)
    @my_message = my_message.split('')
    @key =  "91382"
    @date = 151017  #nDate.today.strftime("%m%e%y").split("").join('').to_i
    @rotations = []
    @alpha_index = []
    @calculated_index = []
    @alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n',
      'o','p','q','r','s','t','u','v','w',
    'x','y','z','1','2','3','4','5','6','7','8','9','0',' ','.',',']
  end
def get_offset
    @date_last_four = (@date ** 2).to_s.split('').last(4).to_a
end
  def rotation
      # @key = key.key
      @date_last_four.each_with_index do |x,i|
      @rotations.push([@key[i],@key[i+1]].join.to_i + @date_last_four[i].to_i)
    end
       @rotations = @rotations * @my_message.length
  end

  def string_to_index
    @my_message.each_with_index do |letter,index|
      @alphabet.each_with_index do |x,i|
         if @my_message[index] == @alphabet[i-1] % 39
            @alpha_index << i
         end
      end
    end
   @alpha_index
  end

  def add_offset
     @alpha_index.each_with_index do |x,i|
     @calculated_index.push(@alpha_index[i] + @rotations[i+1])
   end
   @calculated_index
  end

  def subtract_offset
    @alpha_index.each_with_index do |x,i|
    num = ( @alpha_index[i] - @rotations[i])
    @calculated_index << num %39
    end
    @calculated_index
  end

  def crypt
    final_encryption = []
    @calculated_index.each_with_index do |num, index|
        @alphabet.each_with_index do |x,i|
          if  num % 39 == i+1
              final_encryption << x
          end
        end
    end
       p final_encryption.join
  end


end

#
# encryption = "x5o04"
encrypt = Encryptor.new("hello..end..")
encrypt.get_offset
encrypt.rotation
encrypt.string_to_index
encrypt.add_offset
encrypt.crypt
