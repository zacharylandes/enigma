require './fileio'
require './enigma'

fileio = File.open( ARGV[0],'r' )
plaintext = fileio.read
fileio.close

e = Enigma.new
ciphertext = e.encrypt(plaintext)
result = File.open( ARGV[1],'w' )
result.write(ciphertext)
result.close
#
# fileio.write(ARGV[1], ciphertext)
# fileio.close
