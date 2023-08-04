# rx.rb - The compiled state graph from:
# Original RegExp
# (ab|cd)+
require 'set'

def delta(s, c)
  d = Hash.new { 999 }
  d[[0, 'a']] = 1; d[[0, 'c']] = 3
  d[[1, 'b']] = 2
  d[[3, 'd']] = 4
  d[[2, 'a']] = 1; d[[2, 'c']] = 3
  d[[4, 'a']] = 1
  d[[4, 'c']] = 3
  
  d[[s, c]]
end

def isaccept(s)
  a = Set.new([2,4]).include?(s)  
  end