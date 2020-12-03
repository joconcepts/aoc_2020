#!/ussr/bin/env ruby

input = File.readlines("./input.txt").map do |line|
  line.strip.split('')
end

slopes = [[1,1], [3,1], [5,1], [7,1], [1,2]]
all_slopes = slopes.map do |right, down|
  trees = 0
  x = 0
  input[1..-1].each_slice(down) do |line|
    pos = (x + right) % line.last.count 
    trees += 1 if line.last[pos] == "#"
    x = pos
  end
  puts trees
  trees
end

puts all_slopes.inject(&:*)
