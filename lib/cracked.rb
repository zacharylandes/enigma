require './fileio'
require './enigma'
# require './encryptor'
fileio = File.open( ARGV[0],'r' )
plaintext = fileio.read
fileio.close

e = Enigma.new
ciphertext = e.crack(plaintext)
result = File.open( ARGV[1],'w' )
result.write(ciphertext)
result.close
