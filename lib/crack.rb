class Crack

  def initialize(string, date = @date )
    @date = date
    @my_message = string
    @end_ary = [38,38,5,14,4,38,38]
  end

  def alphabet
   ['a','b','c','d','e','f','g','h','i','j','k','l','m','n',
    'o','p','q','r','s','t','u','v','w',
  'x','y','z','1','2','3','4','5','6','7','8','9','0',' ','.',',']
  end

  def my_message
    @my_message.downcase.split('')
  end

  def code_to_index
    alpha_index = []
    my_message.each_with_index.map do |letter,index|
      alphabet.each_with_index.map do |x,i|
        alpha_index << i  if my_message[index] == alphabet[i-1] %39
      end
    end
    alpha_index
  end

  def find_rotation
      rot = []
      i = -1
     while i > -5
        rot << code_to_index[i].to_i - @end_ary[i].to_i
        i-=1
     end
     rot = rot * my_message.length
  end

  def subtract_rotation
    code_to_index.reverse.each_with_index.map do  |x,i|
    (x - find_rotation[i].to_i)  % 39
    end
  end

  def convert_to_letters
      subtract_rotation.each_with_index.map do |letter,index|
        alphabet.each_with_index.map do |x,i|
           x if letter == i+1
        end
      end.reverse.join
  end

end
