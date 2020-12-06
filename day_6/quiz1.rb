#!/usr/bin/env ruby

groups = File.read("./input.txt").split("\n\n").map do |group|
  group.gsub("\n","").split('').uniq.count
end.sum

puts groups
