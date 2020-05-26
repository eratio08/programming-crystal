# XML Pattern
# <title>1 USD = 0.74402487 GBP</title>
base_currency = "USD"
currency = "GBP"
line = "<title>1 USD = 0.74402487 GBP</title>"

regex = {
  :open  => /<title>1 #{base_currency} = /,
  :close => / #{currency}<\/title>/,
}

rate = line.gsub(regex[:open], "").gsub(regex[:close], "").to_f
