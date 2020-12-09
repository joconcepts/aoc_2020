#!/usr/bin/env ruby

input = File.readlines("./input.txt").map(&:to_i)

i = 25
invalid = 0
while true
  prev = input[i-25..i-1]
  all_sums = prev.combination(2).map(&:sum)
  unless all_sums.include?(input[i])
    invalid = input[i]
    break
  end
  i += 1
end

puts "Invalid number found: #{invalid}"

cont = []
(1..input.count).each do |sum|
  i = 0
  found_cont = false
  puts "Try with #{sum+1} contiguous"
  (0..(input.count - 1)).each do |i|
    cont = input[i..i+sum]
    if cont.sum == invalid
      found_cont = true
      break
    end
  end
  break if found_cont
end

puts "Found: #{cont}"
puts "Sum of min and max: #{cont.min + cont.max}"
