require_relative 'encryptor'

# require './decryptor'
require_relative 'key'

class Enigma
  def encrypt(my_message,key = Key.new, date = @date )
    encrypt = Encryptor.new(my_message, key = Key.new, date =@date )
    encrypt.find_last_four
    encrypt.rotation
    encrypt.code_to_index
    encrypt.add_offset
    encrypt.crypt
  end

  def decrypt(my_message,key = Key.new, date = @date )
    decrypt = Encryptor.new(my_message, key = Key.new, date =@date )
    decrypt.find_last_four
    decrypt.rotation
    decrypt.code_to_index
    decrypt.subtract_offset
    decrypt.crypt
  end


end

e = Enigma.new
e.encrypt("hello")
