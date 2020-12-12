#!/usr/bin/env ruby

input = File.readlines("./input.txt").map do |line|
  line.strip.split('')
end


def next_to_seat(input, x, y)
  size_x = input.first.count
  size_y = input.count
  occ = 0

  directions = [
    [0,1],
    [0,-1],
    [1,0],
    [-1,0],
    [1,1],
    [1,-1],
    [-1,1],
    [-1,-1]
  ]

  directions.each do |dir_x, dir_y|
    index = 1
    while true
      break if y+index*dir_y < 0 or x+index*dir_x < 0
      break if input[y+index*dir_y].nil? or input[y+index*dir_y][x+index*dir_x].nil?
      if input[y+index*dir_y][x+index*dir_x] == "L"
        break
      end
      if input[y+index*dir_y][x+index*dir_x] == "#"
        occ += 1
        break
      end
      index += 1
    end
  end

  occ
end

layout = []
i = 0
while true
  input.each.with_index do |line, y|
    new_line = []
    dir_line = []
    line.each.with_index do |seat, x|
      if seat == "."
        new_line[x] = "."
        next
      end

      other_seats = next_to_seat(input, x, y)
      if seat == "#"
        new_line[x] = other_seats >= 5 ? "L" : "#"
      end

      if seat == "L"
        new_line[x] = other_seats == 0 ? "#" : "L"
      end
    end
    layout << new_line
  end

  break if layout == input
  
  input = layout
  layout = []
  i += 1
end

puts
puts layout.flatten.select{|x| x == "#"}.count
