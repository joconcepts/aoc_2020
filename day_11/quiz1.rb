#!/usr/bin/env ruby

input = File.readlines("./input.txt").map do |line|
  line.strip.split('')
end

size_x = input.first.count
size_y = input.count

def next_to_seat(size_x, size_y, x, y)
  seats = [
    [x-1, y-1],
    [x,   y-1],
    [x+1, y-1],
    [x-1,   y],
    [x+1,   y],
    [x-1, y+1],
    [x,   y+1],
    [x+1, y+1]
  ]
  seats.select do |seat|
    seat[0] >= 0 && seat[0] < size_x &&
      seat[1] >= 0 && seat[1] < size_y
  end
end

layout = []
i = 0
while true
  input.each.with_index do |line, y|
    new_line = []
    line.each.with_index do |seat, x|
      if seat == "."
        new_line[x] = "."
        next
      end

      other_seats = next_to_seat(size_x, size_y, x, y).map do |n|
        input[n[1]][n[0]]
      end.select{|seat| seat == "#"}

      if seat == "#"
        new_line[x] = other_seats.count >= 4 ? "L" : "#"
      end

      if seat == "L"
        new_line[x] = other_seats.count == 0 ? "#" : "L"
      end
    end
    layout << new_line
  end

  break if layout == input
  
  input = layout
  layout = []
  i += 1
end

puts layout.flatten.select{|x| x == "#"}.count
