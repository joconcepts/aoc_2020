#!/usr/bin/env ruby

passports = File.read("./input.txt").split("\n\n").map do |passport|
  passport.split("\n").map do |line|
    line.split(" ")
  end.flatten.map do |kv|
    k,v = kv.split(":")
    [k.to_sym, v]
  end.to_h
end

required_fields = {
  byr: lambda { |val| val.to_i.between?(1920, 2002) },
  iyr: lambda { |val| val.to_i.between?(2010, 2020) },
  eyr: lambda { |val| val.to_i.between?(2020, 2030) },
  hgt: lambda { |val| 
    m = val.match(/^(\d+)(in|cm)$/)
    return false if m.nil?
    m[2] == "in" ? m[1].to_i.between?(59,76) : m[1].to_i.between?(150,193) 
  },
  hcl: lambda { |val| val[/^#[0-9a-f]{6}/] },
  ecl: lambda { |val| %w(amb blu brn gry grn hzl oth).include?(val) },
  pid: lambda { |val| val[/^\d{9}$/] }
}
optional_fields = %w(cid)

valid_passports = passports.select do |passport|
  missing_fields = required_fields.keys - passport.keys
  if missing_fields.empty? || missing_fields == optional_fields
    rest = passport.reject do |k,v|
      k == :cid ? true : required_fields[k].call(v)
    end
    rest.empty?
  end
end

puts valid_passports.count
