# types
minerals = ["alunite", "chromium", "vlasovite"]
p minerals
p typeof(minerals) # => Array(String)
# or, to use a different notation
minerals2 = %w(alunite chromium vlasovite)
p minerals2
p typeof(minerals2) # => Array(String)

# arrays
empty = [] of String

maybe_res = empty[10]?
p maybe_res

# Hashes
hash_1 = {
  "a" => 1,
  "b" => 2,
}

# Controll Flow
hardness = 5.25
if 0 < hardness < 5
  puts "softer than apatite"
elsif hardness < 8
  puts "harder than apatite, softer than topaz"
else
  puts "topaz or harder!"
end

# If Expressions
output = if 0 < hardness < 5
           "softer than apatite"
         elsif hardness < 8
           "harder than apatite, softer than topaz"
         else
           "topaz or harder!"
         end
output # => harder than apatite, softer than topaz

# Conditional Assignment
output = "softer than topaz" if hardness < 8 # => softer than topaz
# or
output = "softer than topaz" unless hardness >= 8
output # => softer than topaz

# Case-When expression
output = case
         when 0 < hardness < 5
           "softer than apatite"
         when hardness < 8
           "harder than apatite, softer than topaz"
         else
           "topaz or harder!"
         end # => harder than apatite, softer than topaz"

# Looping
# Int#times
5.times do
  p "Hi"
  p "Low"
end
# same as:
puts "==> or:"
5.times { p "Hi"; p "Low" }

# Ranges
inc = 2..7
p inc.to_a # => [2, 3, 4, 5, 6, 7] to array
exc = 2...7
p exc.to_a # => [2, 3, 4, 5, 6]

# Range#each
mohs_list = ["nothing", "talc", "gypsum", "calcite", "fluorite", "apatite",
             "orthoclase feldspar", "quartz", "topaz", "corundum", "diamond"]
(2..5).each do |i|
  puts mohs_list[i]
end
# produces:
# gypsum
# calcite
# fluorite
# apatite

mohs_list = ["nothing", "talc", "gypsum", "calcite", "fluorite", "apatite",
             "orthoclase feldspar", "quartz", "topaz", "corundum", "diamond"]
mohs_list.each do |mineral|
  puts mineral
end

# for-like loop
n = 1
loop do
  puts "a mighty crystal"
  n += 1
  break if n == 3
end
# => a mighty crystal
# => a mighty crystal

# while loop
a = 1
while (a += 1) < 10
  if a == 3
    next
  elsif a > 6
    break
  end
  puts a
end # => 2, 4, 5 and 6 on successive lines

# Define a function
def double(n)
  n * 2
end

puts double(300)

# Classes
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

# Modules
module Hardness
  def data
    {"talc" => 1, "calcite" => 3, "apatite" => 5, "corundum" => 9}
  end

  def hardness
    data[self.name]
  end
end

# Mixin
class Mineral
  include Hardness
  getter name : String

  def initialize(@name : String | Nil = nil)
  end
end

min = Mineral.new("corundum")
min.hardness # => 9

puts min
p min
puts min.hardness

# Fibers & Channels
start = Time.local
chan = Channel(String).new
num = 500000
num.times do |i|
  spawn do
    chan.send "fiber #{i}: I like crystals!"
  end
  puts chan.receive
end
endTime = Time.local - start
puts endTime

# begin
#   # some dangerous code here
#   # possibly your own raise "..."
# rescue ex
#   # execute if an exception is raised
#   p ex.message
# else
#   # execute if an exception isn't raised
# ensure
#   # this will always be executed
#   puts "Cleanup..."
# end

# Chaining Methods
result = (42..47).to_a
  .sort { |n, m| m <=> n }
  .reject { |n| n.odd? }
  .map { |n| n * n }
  .select { |n| n % 4 == 0 }
  .tap { |arr| puts "#{arr.inspect}" }
  .sort!
  .any? { |num| num > 2000 }
p result

sum = (42..47).to_a
  .reduce(0) { |sum, num| sum + num }
p sum

# CLI ARGs
puts "Number of command line arguments: #{ARGV.size}"
ARGV.each_with_index do |arg, i|
  puts "Argument #{i}: #{arg}"
end
p ARGV
p "Executable name: #{PROGRAM_NAME}"
p "Path to source file: #{__FILE__}"
p "Folder of source file: #{__DIR__}"

base = ARGV[0]?
base = "USD" unless base

curr1 = "US Dollar"
curr1[2..4]
curr1.reverse
curr1.size
curr1.upcase
curr1.capitalize
curr1.includes? "la"
curr1.count "l"
curr1.starts_with? "Us"
curr1.ends_with? "ar"
curr1.index("a")
curr1.sub("ll", "l")
curr1.gsub(/([aeiou])/, "*\\1*")
curr2 = curr1.split("")
puts curr2.join("-")
puts curr1
puts curr2

# Symbols as Identifiers
class Mineral
  property name

  def initialize(@name : Symbol)
  end
end

mineral1 = Mineral.new(:talc)
mineral2 = Mineral.new(:talc)

p mineral1.name
p mineral2.name
p :talc

# Enums
enum Direction
  North
  East
  South
  West
end

p Direction::South

# RegEx
str = "carbonantimonygolddiamond"
pattern = /gold/
p str =~ pattern

materials = "carbonantimonygolddiamond"
pat = /(.+)gold(.+)/ # searches for gold
str = "carbonantimonygolddiamond"
str =~ pat    # => 0
$1            # => "carbonantimony"
$2            # => "diamond"
str.match pat # => # <Regex::MatchData "

# Tuples
tpl = {31, "silver", 'C'}
p tpl.class
a = Tuple.new(42, "silver", 'C')

p tpl[0]
p tpl[1]
p tpl[2]

h = {1 => '1'}
h[3] ||= 'C'

# Named Tuples aka Records
ntpl = {name: "Crystal", year: 2017}
p ntpl[:name]

# Set
set = Set{41, 42, 43}

# Destructuring
var1, var2, var3 = [78, 56, 42]
var1, var2, var3 = {78, 56, 42}

# Nilable Types
n : Int32 | Nil
n = 42
p typeof(n)

a : Int32?
a = 42
p typeof(a)

b = Int32?
b = nil
p typeof(b)

a.try { p a + 1 }
b.try { p b + 1 }

# Ternary
var1 = 1 > 2 ? 3 : 4
var2 = rand < 0.5 ? 42 : "Crystal"

if int_var = var2.as?(Int32)
  p int_var.abs
end

if var2.nil?
  # test for nil
end

var3 = 42
if var.is_a?(Number)
  # check for type
end

case var3
when Number
  p var3 + 42
when String
  p "we have a string"
else
  p "var3 is not a number nor a string"
end

# FizzBuzz
(1..100).each do |i|
  case {i % 3, i % 5}
  when {0, 0}
    puts "FizzBuzz"
  when {0, _}
    puts "Fizz"
  when {_, 0}
    puts "Buzz"
  else
    puts i
  end
end

# Check by testing for method
var1 = "Crystal"
if var1.responds_to?(:abs)
  var1.abs
end

if var1 = 1
  puts "inside if"
  var1 = 2
  puts var1
end

def t(x : String) : Int
  x.to_i
end

puts t("2")

# Named parameters
def show(x, y = 1, z = 2, w = 3)
  "x: #{x}, y: #{y}, z: #{z}, w: #{w}"
end

puts show 10
puts show 10, 10
puts show 10, 30, 2, 3
puts show 10, z: 10

# Splat Operator
def salaries(*employees)
  employees.each do |emp|
    puts "#{emp}'s salary is: 2500"
  end
end

salaries()
salaries("Jones")
salaries("Baudelaire", "Rogers", "Gandhi")

def display(n, *, height, width)
  "The shape has height #{height} and width #{width}"
end

puts display 3, height: 2, width: 5

# Second named parameter
def increment(number, by value)
  number + value
end

p increment(10, by: 10)

def join(*args, with joiner)
  String.build do |str|
    args.each_with_index do |arg, index|
      str << joiner if index > 0
      str << arg
    end
  end
end

puts join 1, 2, 3, with: "-"
puts join 1, 2, 3, 4, 5, with: "*"

# destructure tuple as arguments
def add(n, m)
  n + m
end

tpl = {42, 108}
puts add *tpl

# Yield, Proc & Blocks (yay!)
def testing
  puts "at top of method"
  yield 1
  puts "back inside method"
  yield 2
  puts "at end of method"
end

testing do
  puts "in code block"
end

testing do |n|
  puts "in code block #{n}"
end

def testing_proc(&block)
  puts "at top of method"
  block.call
  puts "back inside method"
  block.call
  puts "at end of method"
end

testing_proc do
  puts "in code block"
end

langs = %w(Java Go Crystal)
langs.map { |lang| lang.upcase }
puts langs

# Lambda == Proc
fn = ->(n : Int32, m : Int32) { n + m }
puts typeof(fn)
puts fn.call(42, 108)

def add(n, m)
  n + m
end

fn = ->add(Int32, Int32)
puts fn.call(42, 108)

# Proc with return type declared
fn = Proc(Int32, Int32, Int32).new { |n, m| n + m }
fn.call(42, 108)

# Using capturing block
def capture(&block : Int32 -> Int32)
  block
end

n = 42
proc = capture { |m| n + m }
puts proc.call(108)
n = 20
puts proc.call(108)

# Short Exception Handling Syntax
def add_to_array(arr, number)
  arr << number.to_i8
rescue
  puts "integer bigger than 255"
end

# can also be used with 'ensure'

# Recursion
def fact(n : Int) : Int
  if n < 0
    raise ("n cannot be negative!")
  end
  n == 0 ? 1 : n * fact(n - 1)
end

begin
  fact(5)
rescue ex
  p ex.message
end

# exit to quit execution
def fact(n : Int) : Int
  if n < 0
    puts "n must be positive!"
    exit
  end
  n == 0 ? 1 : n * fact(n - 1)
end

# defensive testing
def some_method(n : Int)
  return nul unless n > 1
end

# Generics
class Gen(T)
  getter name

  def initialize(@name : T)
  end
end

min = Gen.new("String")
min2 = Gen.new(42)
min3 = Gen(String).new("bla")

# Inheretance
class Document
  property name

  def initialize(@name : String)
  end

  def print
    puts "Hi, I'm printing #{@name}"
  end
end

class PDFDocument < Document
  def initialize(@name : String, @company : String)
  end

  def print(date : Time)
    super
    puts "Printing #{@name}"
    puts "From company #{@company} at date #{date}"
  end
end

doc = PDFDocument.new("Salary Report Q4 2018", "ACME")
doc.print(Time.now)

# Abstract classes
abstract class Shape
  abstract def area
  abstract def perim
end

class Rect < Shape
  def initialize(@width : Int32, @height : Int32)
  end

  def area
    @width * @height
  end

  def perim
    2 * (@width + @height)
  end
end

Rect.new(3, 6).area

# Virtual Types
class Document # like marker interface ?
end

class PDFDocument < Document
  def print
    puts "PDF header"
  end
end

class XMLDocument < Document
  def print
    puts "XML header"
  end
end

class Report
  getter doc

  def initialize(@name : String, @doc : Document)
  end
end

p Report.new "Salary Report Q4", PDFDocument.new
p Report.new "Tax Report Q1", XMLDocument.new

#  Method visibility
class Document
  property name

  def initialize(@name : String)
  end

  private def print(message)
    puts message
  end

  protected def bla
    puts "bla"
  end

  def printing
    print "Hi, I'm printing #{@name}"
    # self.print "Printing with self does not work"
    # => Error: private method 'print' called for Document
  end
end

class PDFDocument < Document
  def printing
    super
    print "End printing PDFDocument"
  end
end

# Overloading operators
class Mineral
  getter id, name, hardness, crystal_struct
  property quantity : Float32

  def initialize(@id : Int32, @name : String, @hardness : Float64,
                 @crystal_struct : String)
    @quantity = 0f32
  end

  def ==(other : self) # self is Mineral
    id == other.id
  end

  def ==(other)
    false
  end

  def self.compare(m1 : self, m2 : self) # class method
    m1.id == m2.id
  end
end

# Structs
struct User
  property name, age

  def initialize(@name : String, @age : Int32)
  end

  def print
    puts "#{age} - #{name}"
  end
end

# crystal tool hierarchy virtual.cr - to show type hierarchie

# type aliasing
alias PInt = Pointer(Int32)

# Some Nice Tricks
# Effective way to construct a string
class Mineral
  getter name, hardness

  def initialize(@name : String, @hardness : Float64)
  end

  # Good
  def to_s(io)
    io << name << ", " << hardness
  end
end

min1 = Mineral.new("gold", 42.0)
io = IO::Memory.new
s = min1.to_s(io).to_s
puts typeof(s)
puts s

# Exception Class
class CoolException < Exception
end

# raise CoolException.new("Somebody pushed the red button")

ex = begin
  raise CoolException.new
rescue ex1 : IndexError
  ex1.message
rescue ex2 : CoolException | KeyError
  ex2.message
rescue ex3 : Exception
  ex3.message
rescue
  "an unknown exception"
end

# Callbacks
class MineralC
  def initialize
    @callbacks = [] of ->
  end

  def after_save(&block)
    @callbacks << block
  end

  def save
    # save
    puts "Saving..."
  rescue ex
    p "Exception occured: #{ex.message}"
  else
    @callbacks.each &.call
  end
end

min = MineralC.new
min.after_save { puts "Save in DB successful" }
min.after_save { puts "Logging save" }
min.after_save { puts "Replicate save a failover node" }
min.save

# Modules
module Crystals
  class Rhombic
  end

  class Tricilin
  end
end

t = Crystals::Rhombic.new
puts typeof(Crystals)

module Trig
  PI = 3.141592654

  def self.sin(x)
    puts "Calculating the sin of #{x}"
  end

  def self.cos(x)
    # ...
  end
end

# Modules can extend them self to ommit self. prefix
module Moral
  extend self
  VERY_BAD = 0
  BAD      = 1

  def sin(badness)
    puts "Assesing the sin of #{badness}"
  end
end

# load modules by using 'require'
# flatten included module by using 'include'

# Mixin in Modules with include

class Basic
  def initialize(@name : String)
  end

  def to_s
    @name
  end
end

module Debug
  def who_am_i?
    "#{self.class.name} (\##{self.object_id}): #{self.to_s}"
  end
end

class DVD < Basic
  include Debug
end

class BlueRay < Basic
  include Debug
end

dv = DVD.new("West End Blues")
br = BlueRay.new("Attack of the Martians")
puts dv.who_am_i?
puts br.who_am_i?

# Use module methods on the class level 'extend' is used
module DebugC
  def who_am_i?
    "#{self.class.name}: #{self.to_s}"
  end
end

class CD < Basic
  extend DebugC
end

cd = CD.new("Bach's Cello Suites")
puts cd.who_am_i?
puts CD.who_am_i?

# Classes can include and extend multiple modules

# Each class (type) has an anchestor list (parent classes)
# (a class -> super class -> ... -> objects)

# To avoid the diamond problem included modules take precedence
module M1
  def meth1
    41
  end
end

class C1
  def meth1
    42
  end
end

class D1 < C1
  include M1
end

class E1 < D1
end

puts E1.new.meth1

# Build in Modules

# Comparable
class Person
  include Comparable(Person)

  getter name, age

  def initialize(@name : String, @age : UInt8)
  end

  def <=>(other : self)
    # if self.age < other.age
    #   -1 # <
    # elsif self.age > other.age
    #   1 # >
    # else
    #   0 # ==
    # end
    self.age <=> other.age
  end
end

# Enumerable
class Sequence
  include Enumerable(Int32)

  def initialize(@top : Int32)
  end

  def each
    0.upto(@top) { |num| yield num }
  end
end

seq = Sequence.new(7)
puts seq.to_a
puts seq.select &.even?
puts seq.map { |x| x**2 }

# Interators for lazyness
n = 0
inc = Iterator.of {
  n += 1
  n
}

puts inc.next
puts inc.next
puts inc.next

n = 1
m = 1
fib = Iterator.of {
  ret = n
  n = m
  m += ret
  ret
}

puts fib
  .select { |x| x.even? }
  .first(10)
  .to_a
