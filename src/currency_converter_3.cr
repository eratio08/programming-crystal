base = "USD"
rates = {
  "EUR" => 0.84320536,
  "CAD" => 1.26761115,
  "CNY" => 6.61591576,
}

full_names = {
  "EUR" => "Euro",
  "CAD" => "Canadian Dollar",
  "CNY" => "Chinese Yuan",
}

output = "1 #{base} = \n" +
         rates.keys.map do |curr|
           "\t#{rates[curr]} #{full_names[curr]}s (#{curr})"
         end.join("\n")

puts output
puts
amount = 42

output = "#{amount} #{base} = \n" +
         rates.keys.map do |curr|
           temp = sprintf("%3.2f", amount * rates[curr])
           "\t#{temp} #{full_names[curr]}s (#{curr})"
         end.join("\n")

puts output
