require_relative 'test_helper'
require "./lib/enigma"
require "./lib/crack"


class EngimaTest < Minitest::Test

  def test_it_can_encrypt_wit_key_date_input
      e = Enigma.new

      assert_equal ("ikanzutnihmx4utoxh3txb"), e.encrypt("why are we here..end..","12345",191017)
  end

  def test_it_can_decrypt_with_key_date_input
      e = Enigma.new

      assert_equal ("this message..end.."), e.decrypt("fkx9wpt9edvuxbt43bn","12345",161017)
  end

  def test_it_can_decrypt_without_date_input
      e = Enigma.new

      assert_equal ("take me home..end.."), e.decrypt("fdzuwptn7r2uxbt43bn","12345")
  end

  def test_it_can_convert_to_indeces
      e = Enigma.new

      assert_equal ("welcome to the end of times..end.."), e.crack(".lyt4tro9vk wlkv3kk6ue7z2l6pnl1unf", 101517)
  end

end
