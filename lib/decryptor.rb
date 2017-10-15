class Decryptor
  def initialize(code, key = 12345, date = 101317)
    @code = code.split('')
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
    @rot = @rot*@code.length
  end

  def string_to_index
    @code.each_with_index do |letter,index|
      @alphabet.each_with_index do |x,i|
         if @code[index] == @alphabet[i-1] %26
           @alpha_index << i
         end
      end
    end
    p @alpha_index
  end

  def add_offset
    num = 0
    @alpha_index.each_with_index do |x,i|
   num =  @alpha_index[i] - @rot[i]
   num = num % 26
    if num < 0
      num = 26 - num
    end
    @alpha <<  num
 end
p @alpha
  end

  def decrypt
    @alpha.each_with_index do |num, index|
        @alphabet.each_with_index do |x,i|
          if  num %26 == i+1
                 p x
          end
        end
    end
  end
end
decrypt = Decryptor.new("xfbneasdsadsd")
decrypt.offset_key
decrypt.key_date
decrypt.string_to_index
decrypt.add_offset
decrypt.decrypt
