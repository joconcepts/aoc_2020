#!/usr/bin/env ruby

passports = File.read("./input.txt").split("\n\n").map do |passport|
  passport.split("\n").map do |line|
    line.split(" ")
  end.flatten.map do |kv|
    kv.split(":")
  end.to_h
end

required_fields = %w(byr iyr eyr hgt hcl ecl pid)
optional_fields = %w(cid)

valid_passports = passports.select do |passport|
  missing_fields = required_fields - passport.keys
  missing_fields.empty? || missing_fields == optional_fields
end

puts valid_passports.count
