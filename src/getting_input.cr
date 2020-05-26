puts "Enter the number one by one, and end with an empty line:"
arr = [] of Int8

puts "Enter a number"
while num = read_line
  if num == "" || num == "stop"
    break
  end
  arr << num.to_i8
  p "You entered #{num}"
end
p arr
