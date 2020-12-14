#!/usr/bin/env ruby

input = File.readlines("./input.txt")

bus_ids = input.last.split(",").map.with_index do |bus, i|
  b = bus.to_i
  [b, b.zero? ? 0 : -i % b]
end.reject { |p| p.first.zero? }

# chinese remainder theorem from rosettacode.org
def extended_gcd(a, b)
  last_remainder = a.abs
  remainder = b.abs
  x = 0
  last_x = 1
  y = 1
  last_y = 0

  while remainder != 0
    last_remainder, (quotient, remainder) = remainder, last_remainder.divmod(remainder)
    x, last_x = last_x - quotient * x, x
    y, last_y = last_y - quotient * y, y
  end

  [last_remainder, last_x * (a.negative? ? -1 : 1)]
end

def invmod(e, et)
  g, x = extended_gcd(e, et)
  raise 'Multiplicative inverse modulo does not exist!' if g != 1

  x % et
end

def chinese_remainder(mods, remainders)
  lcm = mods.reduce(:*)
  series = remainders.zip(mods).map { |r, m| (r * lcm * invmod(lcm / m, m) / m) }
  series.reduce(:+) % lcm
end

bus_moduli = bus_ids.map(&:first)
bus_remainders = bus_ids.map { |p| p[1] }
puts chinese_remainder(bus_moduli, bus_remainders)
