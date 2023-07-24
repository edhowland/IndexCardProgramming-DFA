# dfa.rb : finite state machine in Ruby
require_relative 'table'

i=ARGV[0]
s=0
until i.empty?
  c = i[0]; i = i[1..]
#puts i
  s = delta(s, c)
end
puts isaccept(s)
puts "s was: #{s}"