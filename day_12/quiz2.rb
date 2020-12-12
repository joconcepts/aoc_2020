#!/usr/bin/env ruby

input = File.readlines("./input.txt").map do |line|
  m = line.match(/^([A-Z])(\d+)$/)
  [m[1], m[2].to_i]
end

y, x = 0, 0
way_y, way_x = 1, 10

input.each do |dir, value|
  case dir
  when "F"
    y += value * way_y
    x += value * way_x
  when "N"
    way_y += value
  when "S"
    way_y -= value
  when "E"
    way_x += value
  when "W"
    way_x -= value
  when "R"
    r = (value*-1) * Math::PI/180
    new_way_y = (way_x * Math.sin(r) + way_y * Math.cos(r)).round
    new_way_x = (way_x * Math.cos(r) - way_y * Math.sin(r)).round
    way_y, way_x = new_way_y, new_way_x
  when "L"
    r = value * Math::PI/180
    new_way_y = (way_x * Math.sin(r) + way_y * Math.cos(r)).round
    new_way_x = (way_x * Math.cos(r) - way_y * Math.sin(r)).round
    way_y, way_x = new_way_y, new_way_x
  end
end

puts x.abs + y.abs
