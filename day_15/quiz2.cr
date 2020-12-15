#!/usr/bin/env ruby

input_lines = File.read_lines("./input.txt").map do |line|
  line.strip.split(",").map{|x| x.to_i}
end

input_lines.each do |input|
  counter = {} of Int32 => Int32
  input.each.with_index do |number, index|
    counter[number] = index+1
  end
  last_number = 0
  (input.size+2..30000000).each do |i|
    c = counter[last_number]? || 0
    counter[last_number] = i-1
    last_number = c == 0 ? 0 : (i-1) - c
  end
  puts "#{input.inspect} - #{last_number}"
end
