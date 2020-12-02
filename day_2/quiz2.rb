#!/usr/bin/env ruby

lines = File.readlines("input1.txt")
matching = lines.select do |line|
  validator, password = line.split(":").map(&:strip)
  position, char = validator.split(" ").map(&:strip)
  position = position.split("-").map(&:to_i)

  (password[position[0]-1] != char && password[position[1]-1] == char) ||
    (password[position[0]-1] == char && password[position[1]-1] != char)
end

puts matching.count
