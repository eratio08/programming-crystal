require "benchmark"

IOM = IO::Memory.new

Benchmark.ips do |x|
  x.report("Using -1") do
    minus_one
    IOM.clear
  end

  x.report("Using last") do
    last()
    IOM.clear
  end
end

def gen_arr(size : Int32) : Array(Int32)
  n = 1
  iter = Iterator.of {
    n += 1
    n
  }
  iter
    .first(size)
    .to_a
end

ARR = gen_arr(100)

def last
  IOM << ARR.last
end

def minus_one
  IOM << ARR[-1]
end
