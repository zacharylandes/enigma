require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require "../lib/encryptor"

class EncryptorTest < Minitest::Test
def test_it_can_add_key_to_offset
  encrypt = Encryptor.new("hello")
  rotations = [16, 27, 42, 54, 16, 27, 42, 54, 16, 27, 42,
     54, 16, 27, 42, 54, 16, 27, 42, 54]

  assert_equal rotations, encrypt.key_date

end
def test_it_can_find_letter_indeces
letter_indeces = [8, 5, 12, 12, 15]
encrypt = Encryptor.new("hello")

assert_equal letter_indeces, encrypt.string_to_index
end

def test_it_can_add_letter_index_to_rotation
  encrypt = Encryptor.new("hello")
  encrypt.key_date
  encrypt.string_to_index

  assert_equal [24, 32, 54, 66, 31], encrypt.add_offset
end

def test_it_can_encrypt
  encryption = "x5o04"
  encrypt = Encryptor.new("hello")
  encrypt.key_date
  encrypt.string_to_index
  encrypt.add_offset

  assert_equal encryption, encrypt.encrypt

end

end
