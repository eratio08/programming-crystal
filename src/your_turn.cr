# # 4
# Lyrics
# 99 bottles of beer on the wall, 99 bottles of beer.
# Take one down, pass it around, 98 bottles of beer on the wall...

(99.downto(1)).each do |n|
  puts "#{n} bottles of beer on the wall, #{n} bottles of beer."
  puts "Take one down, pass it around, #{n - 1} bottles of beer on the wall... "
end

# n = 99
# while (n -= 1) > 0
#   puts "#{n} bottles of beer on the wall, #{n} bottles of beer."
#   puts "Take one down, pass it around, #{n - 1} bottles of beer on the wall... "
#   n
# end

# # 5
def sample(size : Int32)
  arr = Array.new(size, 0.0)
  i = size
  while (i -= 1) > 0
    arr[i] = rand()
  end
  arr
end

puts (sample(5))
puts (sample(5).size)

# # 6
class Mineral
  getter common_name : String
  setter common_name
  getter hardness : Float64
  setter crystal_struct
  getter crystal_struct : String | Nil

  def initialize(common_name, hardness)
    @common_name = common_name
    @hardness = hardness
    @crystal_struct = nil
  end

  def describe
    "This is #{common_name} with a Mohs hardness of #{hardness}
    and a structure of #{crystal_struct}."
  end

  def to_s
    "Mineral[common_name=#{common_name}, hardness=#{hardness}, crystl_struct=#{crystal_struct}]"
  end
end

mine = Mineral.new("talc", 1.0)
puts mine.common_name # => talc
mine.common_name = "gold"
puts mine.common_name # => gold
puts mine.hardness    # => 1.0
puts mine.to_s

# # 7
p int8 = 1_i8     # 8-bit signed integer
p int16 = 16_i16  # 16-bit signed integer
p int32 = 132_i32 # 32-bit signed integer
p int64 = 164_i64 # 64-bit signed integer
p uns64 = 264_u64 # 64-bit unsigned integer
p int64 + int32 + uns64
p int8 + int64 # will fail because type of the first argument will be used

# Chapter 3
# a)
names = "gold;topaz;apatite;wolframite;calcite;diamond"
  .split(";")
  .map { |x| x.upcase }
p names

# b)
# c)
w1 = "word"
w2 = "word"
puts w1.object_id == w2.object_id
