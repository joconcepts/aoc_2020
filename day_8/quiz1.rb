#!/usr/bin/env ruby

input = File.readlines("./input.txt").map do |line|
  action, value = line.split
  [action, value.to_i]
end

acc = 0
i = 0
already_run = []

while true
  if already_run.include?(i)
    puts "Already run!"
    break
  end
  already_run << i
  case input[i][0]
  when "acc"
    acc += input[i][1]
    i += 1
  when "jmp"
    i += input[i][1]
  when "nop"
    i += 1
  end
end

puts acc
