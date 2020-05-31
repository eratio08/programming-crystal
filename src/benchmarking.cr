require "benchmark"

IOM = IO::Memory.new

Benchmark.ips do |x|
  x.report("Appending") do
    append
    IOM.clear
  end

  x.report("Using to_s") do
    to_s
    IOM.clear
  end

  x.report("Interpolation") do
    interpolation
    IOM.clear
  end
end

def append
  IOM << 42
end

def to_s
  IOM << 42.to_s
end

def interpolation
  IOM << "#{42}"
end

Benchmark.bm do |x|
  x.report("Appending bm") do
    IOM.clear
    10_000_000.times do
      append
    end
  end
  x.report("Using to_s bm") do
    IOM.clear
    10_000_000.times do
      append
    end
  end
  x.report("Interpolation bm") do
    IOM.clear
    10_000_000.times do
      append
    end
  end
end
