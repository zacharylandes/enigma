require_relative 'encryptor'
require_relative 'crack'
require 'date'
require_relative 'key'

class Enigma
  attr_reader :key, :date

  def initialize
    @key = Key.new
    @date = date
  end

  def encrypt(my_message, key = @key.key, date = @date)
    encrypt = Encryptor.new(my_message, key, date)
    encrypt.rotation
    encrypt.code_to_index
    encrypt.add_offset
    encrypt.crypt
  end

  def decrypt(my_message, key , date = @date )
    decrypt = Encryptor.new(my_message, key, date )
    decrypt.rotation
    decrypt.code_to_index
    decrypt.subtract_offset
    decrypt.crypt
  end

  def crack(my_message,date = @date)
    crack = Crack.new(my_message, date)
    crack.code_to_index
    crack.convert_to_letters
  end
end
