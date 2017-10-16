require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require "../lib/decryptor"

class DecryptorTest < Minitest::Test
def test_it_can_add_key_to_offset
  decrypt = Decryptor.new("x5o04")
  rotations = [16, 27, 42, 54, 16, 27, 42, 54, 16, 27, 42,
     54, 16, 27, 42, 54, 16, 27, 42, 54]

  assert_equal rotations, decrypt.key_date

end
def test_it_can_find_letter_indeces
letter_indeces = [24, 32, 15, 27, 31]


decrypt = Decryptor.new("x5o04")

assert_equal letter_indeces, decrypt.code_to_index
end

def test_it_can_subtract_letter_index_to_rotation
  decrypt = Decryptor.new("x5o04")
  decrypt.key_date
  decrypt.code_to_index

  assert_equal [8, 5, 66, 66, 15], decrypt.subtract_offset
end

def test_it_can_decrypt
  decryption = "hello"
  decrypt = Decryptor.new("x5o04")
  decrypt.key_date
  decrypt.code_to_index
  decrypt.subtract_offset

  assert_equal decryption, decrypt.decrypt

end

end
