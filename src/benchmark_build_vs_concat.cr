require "benchmark"

IOM = IO::Memory.new

Benchmark.ips do |x|
  x.report("Using builder") do
    builder
    IOM.clear
  end

  x.report("Using concat") do
    concatStr
    IOM.clear
  end
end

def builder
  IOM << String.build do |str|
    str << "A"
    str << "B"
    str << "C"
    str << "E"
  end
end

def concatStr
  IOM << "A" + "B" + "C" + "D" + "E"
end
