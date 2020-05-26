CURRENCIES = {
  "EUR" => "Euro",
  "CAD" => "Canadian Dollar",
  "CNY" => "Chinese Yuan",
}

puts "Enter the base currency, default is: USD"
base = read_line
exit unless base
if base.strip == ""
  base = "USD"
end
puts "Enter the orther currencies and their exchange rate,"
puts "like this: EUR - 0.84320536"
puts "Stop input by entering 'stop'"
rates = Hash(String, Float64).new
while input = gets
  break unless input
  input = input.strip
  if input == "" || input == "stop"
    puts "No more input: ok, we stop"
    break
  end
  if !input.includes?(" - ")
    raise "Wrong input format, use: CUR - 1.23456"
  end
  arr = input.split(" - ")
  curr = arr[0].upcase
  if curr.size != 3
    raise "Currency code must be 3 characters"
  end
  rate = arr[1]
  begin
    rates[curr] = rate.to_f
  rescue # very slow
    raise "rate is no decimal number"
  end
end
puts "base: #{base}"
puts "rates: #{rates}"
