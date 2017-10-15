class Encryptor
  def initialize(string, key = 12345, date = 101317)
    @string = string.split('')
    @key =  key.to_s.split('')
    @date = date
    @offset_precursor = nil
    @rot = []
    @alpha_index = []
    @alpha = []
    @alphabet = ["a","b","c","d","e","f","g","h","i","j",
      "k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

  end

  def offset_key
      date_squared = @date ** 2
      @offset_precursor = date_squared.to_s.split('').last(4).to_a
  end
  def key_date
     @offset_precursor.each_with_index do |x,i|
     @rot.push([@key[i],@key[i+1]].join.to_i + @offset_precursor[i].to_i)
    end
   p @rot = @rot*@string.length
  end

  def string_to_index
    @string.each_with_index do |letter,index|
      @alphabet.each_with_index do |x,i|
         if @string[index] == @alphabet[i-1] %26
           @alpha_index << i
         end
      end
    end
  end

  def add_offset
    @alpha_index.each_with_index do |x,i|
    @alpha.push(@alpha_index[i] + @rot[i])
   end
  end

  def encrypt
    @alpha.each_with_index do |num, index|
        @alphabet.each_with_index do |x,i|
          if  num %26 == i+1
                x
          end
        end
    end
  end
end

#   if @string[index] == @alphabet[i-1]
#     p alpha_index << @rotation_b = @rotation_b + i % 26
#      return
#    end
# if @string[index] == @alphabet[i-1]
#   p alpha_index << @rotation_c = @rotation_c + i % 26
#    return
#  end
# if @string[index] == @alphabet[i-1]
#   p alpha_index << @rotation_d = @rotation_d + i % 26
#    return
#   end

# @string.each_with_index do |num, index|
# @alphabet.each_with_index do |x,i|
#   if @string[index] == @alphabet[i-1]
#      p alpha_index << @rotation_b = @rotation_b + i % 26
#   end
# end
# end
# @string.each_with_index do |num, index|
# @alphabet.each_with_index do |x,i|
#   if @string[index] == @alphabet[i-1]
#      p @rotation_b = @rotation_b + i % 26
#   end
# end
# end
# @string.each_with_index do |num, index|
# @alphabet.each_with_index do |x,i|
#   if @string[index] == @alphabet[i-1]
#      p @rotation_c = @rotation_c + i % 26
#   end
# end
# end
# @string.each_with_index do |num, index|
# @alphabet.each_with_index do |x,i|
#   if @string[index] == @alphabet[i-1]
#      p @rotation_d = @rotation_d + i % 26
#   end
# end
# end

  # @alphabet.each_with_index do |x,i|
  #   if @string[1] == @alphabet[i-1]
  #     p @alphabet[i-1+@rotation_b]
  #   end
  #     end
  #   @alphabet.each_with_index do |x,i|
  #     if @string[2] == @alphabet[i-1]
  #       p @alphabet[i-1+@rotation_c]
  #     end
  #       end
  # @alphabet.each_with_index do |x,i|
  #   if @string[3] == @alphabet[i-1]
  #     p @alphabet[i-1+@rotation_d]
  #   end
  #     end
  # @alphabet.each_with_index do |x,i|
  #   if @string[4] == @alphabet[i-1]
  #     p @alphabet[i-1+@rotation_a]
  #   end
  #     end
  # end


#    @offset
#    key_rot_a = @offset[0].to_i
#     offset_rot_a = @key.to_s.split('').first(2).join('').to_i
#     p  key_rot_a + offset_rot_a
# enddef rot_a
#    @offset
#    key_rot_a = @offset[0].to_i
#     offset_rot_a = @key.to_s.split('').first(2).join('').to_i
#     p  key_rot_a + offset_rot_a
# end

encrypt = Encryptor.new("hello")
encrypt.offset_key
encrypt.key_date
encrypt.string_to_index
encrypt.add_offset
encrypt.encrypt
