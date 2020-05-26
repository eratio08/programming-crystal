# def fib_iter(n, n1, n2)
#   return n if n <= 1
#   fib(n)
#   fib(n - 1) + fib(n - 2)
# end

# fib 0 = 0
# fib 1 = 1
# fib n = fib n-1 + fib n-2

def fib(n)
  return n if n <= 1
  fib(n - 1) + fib(n - 2)
end

sum = 0
(1..43).each do |i|
  sum += fib(i)
end

p sum
