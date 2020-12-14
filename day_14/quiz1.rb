#!/usr/bin/env ruby

mem = []
mask = ""
File.readlines("./input.txt").map do |line|
  if line.start_with?("mask")
    mask = line[/^mask = (\S+)$/,1]
    next
  end
  if line.start_with?("mem")
    m = line.match(/^mem\[(\d+)\] = (\d+)$/)
    index = m[1].to_i
    value = m[2].to_i.to_s(2).rjust(36, "0")

    result = value.split("").map.with_index do |v, i|
      out = v
      if %w(0 1).include?(mask[i])
        out = mask[i]
      end
      out
    end.join("")

    mem[index] = result.to_i(2)
  end
end

puts mem.compact.sum
