#!/usr/bin/env ruby

input = File.readlines("./input.txt").map(&:to_i).sort
input.prepend(0)
input.append(input.max + 3)

diffs = []
(1..input.count-1).each do |i|
  diff = input[i] - input[i-1]
  diffs << diff
end

grouped = diffs.group_by{|x| x}.map{|k,v| [k, v.count]}.to_h
puts grouped[1] * grouped[3]
