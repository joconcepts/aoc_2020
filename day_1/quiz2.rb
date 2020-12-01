#!/usr/bin/env ruby

input = File.readlines("input1.txt").map(&:to_i)

sum = 2020
output = []
catch :get_out do
  input.each.with_index do |i, index|
    part = input[index..]
    diff = sum - i
    part.each.with_index do |i2, index2|
      found = part[index2..].find do |i3|
        diff - i2 == i3
      end
      if found
        output = [i, i2, found]
        puts output
        throw :get_out
      end
    end
  end
end

puts output.inject(:*)
