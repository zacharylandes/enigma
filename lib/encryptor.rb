require_relative 'key'
require 'date'


class Encryptor
  attr_reader :alphabet
  def initialize(string, key, date = @date)
    @my_message = string
    @key = key
    @date = date
    @calculated_index = []
  end

  def alphabet
   ['a','b','c','d','e','f','g','h','i','j','k','l','m','n',
    'o','p','q','r','s','t','u','v','w',
  'x','y','z','1','2','3','4','5','6','7','8','9','0',' ','.',',']
  end

  def date_conversion
    @date = Date.today.strftime("%e%m%y").split("").join('').to_i
  end

  def my_message
    @my_message.downcase.split('')
  end

  def find_last_four
     (date_conversion ** 2).to_s.split('').last(4).to_a
  end

  def rotation
    find_last_four.each_with_index.map do |x,i|
     [@key[i],@key[i+1]].join.to_i + find_last_four[i].to_i
    end
  end

  def code_to_index
    alpha_index=[]
    my_message.each_with_index.map do |letter,index|
      alphabet.each_with_index.map do |x,i|
        alpha_index << i  if my_message[index] == alphabet[i-1] %39
      end
    end
     alpha_index
  end

  def add_offset
    rot_key =  rotation * 10
    code_to_index.each_with_index do |x,i|
      @calculated_index.push(code_to_index[i] + rot_key[i+1])
    end
  end

  def subtract_offset
    rot_key =  rotation * 10
    code_to_index.each_with_index do |x,i|
      num = (code_to_index[i] - rot_key[i+1]) % 39
      @calculated_index << num
    end
  end

  def crypt
    @calculated_index.each_with_index.map do |num, index|
      alphabet.each_with_index.map do |x,i|
        x if num % 39  == i+1
      end
    end.join
  end
end
