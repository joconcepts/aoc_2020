#!/usr/bin/env ruby

input = File.readlines("input1.txt").map(&:to_i)

sum = 2020
output = input.each.with_index do |i, index|
  found = input[index..].find do |i2|
    sum - i == i2
  end
  break [i, found] if found
end

puts output.inject(:*)
