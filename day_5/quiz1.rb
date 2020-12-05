#!/usr/bin/env ruby

input = File.readlines("./input.txt")

positions = input.map do |seat|
  row = (0..127).to_a
  seat[0..6].split('').each do |row_pos|
    half = row.count / 2
    row = row_pos == 'F' ? row[0..(half-1)] : row[half..(row.count-1)] 
  end

  col = (0..7).to_a
  seat[7..9].split('').each do |col_pos|
    half = col.count / 2
    col = col_pos == 'L' ? col[0..(half-1)] : col[half..(col.count-1)] 
  end

  row.first * 8 + col.first
end

puts positions.max
