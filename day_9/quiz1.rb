#!/usr/bin/env ruby

input = File.readlines("./input.txt").map(&:to_i)

i = 25
while true
  prev = input[i-25..i-1]
  all_sums = prev.combination(2).map(&:sum)
  unless all_sums.include?(input[i])
    puts input[i]
    break
  end
  i += 1
end
