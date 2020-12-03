#!/ussr/bin/env ruby

input = File.readlines("./input.txt").map do |line|
  line.strip.split('')
end

trees = 0
x = 0
input[1..-1].each do |line|
  pos = (x+3) % line.count 
  trees += 1 if line[pos] == "#"
  x = pos
end

puts trees
