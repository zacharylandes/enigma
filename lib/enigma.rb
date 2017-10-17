require './encryptor'
# require './decryptor'
require './key'

class Enigma
  #
  # def encrypt(message)
  #   e = Encryptor.new(message)
  # end

  def initialize

  end
  def encrypt(my_message,key = Key.new, date = @date )

    encrypt = Encryptor.new(my_message, key = Key.new, date =@date )
    encrypt.get_offset
    encrypt.rotation
    encrypt.string_to_index
    encrypt.add_offset
    encrypt.crypt
  end
  def decrypt(my_message,key = Key.new, date = @date )
    decrypt = Encryptor.new(my_message, key = Key.new, date =@date )
    decrypt.get_offset
    decrypt.rotation
    decrypt.string_to_index
    decrypt.subtract_offset
    decrypt.crypt
  end
  #


end
