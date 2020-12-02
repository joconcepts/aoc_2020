#!/usr/bin/env ruby

lines = File.readlines("input1.txt")
matching = lines.select do |line|
  validator, password = line.split(":").map(&:strip)
  amount, char = validator.split(" ").map(&:strip)
  amount = amount.split("-").map(&:to_i)

  password.count(char).between?(*amount)
end

puts matching.count
