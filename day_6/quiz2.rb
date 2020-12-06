#!/usr/bin/env ruby

groups = File.read("./input.txt").split("\n\n").map do |group|
  persons = group.split("\n").count
  answers = group.gsub("\n","").split('')
  answers.group_by{ |i| i }.map{ |k,v| [k, v.size] }.to_h.select do |_, answered|
    answered == persons
  end.keys.count
end.sum

puts groups
