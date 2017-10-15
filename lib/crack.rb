class Decryptor
  def initialize(code, key = 12345, date = 101317)
    @code = code.split('')
    @key =  key.to_s.split('')
    @date = date
    @pre_offset = nil
    @rot = []
    @alpha_index = []
    @alpha = []
    @alphabet = ["a","b","c","d","e","f","g","h","i","j",
      "k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]

  end

  def offset_key
      date_squared = @date ** 2
      @pre_offset = date_squared.to_s.split('').last(4).to_a
  end
  def key_date
     @pre_offset.each_with_index do |x,i|
     @rot.push([@key[i],@key[i+1]].join.to_i + @pre_offset[i].to_i)
    end
    @rot = @rot * @code.length
  end

  def code_to_index
    @code.each_with_index do |letter,index|
      @alphabet.each_with_index do |x,i|
         if @code[index] == @alphabet[i-1] %26
           @alpha_index << i
         end
      end
    end
    # p @alpha_index
  end

  def add_offset
    @alpha_index.each_with_index do |x,i|
   num = ( @alpha_index[i] - @rot[i]) % 26
      num = 26 - num if num < 0
    @alpha <<  num
 end
# p @alpha
  end

  def decrypt
    @alpha.each_with_index do |num, index|
        @alphabet.each_with_index do |x,i|
          if  num  == i+1
                 p x
          end
        end
    end
  end
end
decrypt = Decryptor.new("xfbneasdsadsd")
decrypt.offset_key
decrypt.key_date
decrypt.code_to_index
decrypt.add_offset
decrypt.decrypt
