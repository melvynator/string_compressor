class ShortStringPacker
  ## Packs a short string into a Fixnum
  # Arguments:
  #   str - String object
  # Returns: a Fixnum object
  def self.pack(str)
    packed_value = "1"
    str.each_char do |char|
      five_bits_char = format('%05d', (char.ord - 'a'.ord).to_s(2) % 100000 )
      packed_value += five_bits_char
    end
    puts packed_value.to_i(2)
    return packed_value.to_i(2)
  end

  ## Unpacks a Fixnum from pack() method into a short string
  # Arguments:
  #   packed - a Fixnum object
  # Returns: a String object
  def self.unpack(packed)
    string_packed = packed.to_s(2)
    string_packed[0] = '' # Drop the plus one bit
    chars_pack = string_packed.scan(/[01]{5}/) # Split the string into a group of 5 bits
    unpacked_string = ""
    chars_pack.map do |pack|
      unpacked_string += (pack.to_i(2) + 'a'.ord).chr 
    end
    return unpacked_string
  end
end


ShortStringPacker.pack("abc")
ShortStringPacker.unpack(32802)
