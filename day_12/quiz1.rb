#!/usr/bin/env ruby

input = File.readlines("./input.txt").map do |line|
  m = line.match(/^([A-Z])(\d+)$/)
  [m[1], m[2].to_i]
end

y, x = 0, 0

directions = {
  E: [0,  1],
  S: [-1, 0],
  W: [0, -1],
  N: [1,  0]
}
current_dir = :E
input.each do |dir, value|
  case dir
  when "F"
    f_y, f_x = directions[current_dir]
    y += f_y * value
    x += f_x * value
  when "N"
    y += value
  when "S"
    y -= value
  when "E"
    x += value
  when "W"
    x -= value
  when "R"
    current_index = directions.keys.index(current_dir)
    new_dir = ((value / 90) + current_index) % 4
    current_dir = directions.keys[new_dir]
  when "L"
    current_index = directions.keys.index(current_dir)
    new_dir = ((value * 3 / 90) + current_index) % 4
    current_dir = directions.keys[new_dir]
  end
end

puts "X: #{x}, Y: #{y}"
puts x.abs + y.abs
