#!/usr/bin/env ruby

mem = {}
mask = ""
File.readlines("./input.txt").map do |line|
  if line.start_with?("mask")
    mask = line[/^mask = (\S+)$/,1]
    next
  end
  if line.start_with?("mem")
    m = line.match(/^mem\[(\d+)\] = (\d+)$/)
    mem_index = m[1].to_i
    value = mem_index.to_s(2).rjust(36, "0")
    content = m[2].to_i

    floating_bits = []
    result = value.split("").map.with_index do |v, i|
      out = v
      if %w(1 X).include?(mask[i])
        out = mask[i]
      end
      if mask[i] == "X"
        floating_bits << i
      end
      out
    end

    new_mem = []
    [0,1].repeated_permutation(floating_bits.count).each do |bits|
      a = result.dup
      floating_bits.each.with_index do |bit, index|
        a[bit] = bits[index]
      end
      new_mem << a.join("").to_i(2)
    end

    new_mem.each.with_index do |n, index|
      mem[n] = content
    end
  end
end

puts mem.values.compact.sum
