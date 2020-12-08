#!/usr/bin/env ruby

changed = []

acc = 0
while true
  acc = 0
  i = 0
  already_run = []
  already_changed = false

  input = File.readlines("./input.txt").map do |line|
    action, value = line.split
    [action, value.to_i]
  end
  jmp_nop_count = input.select{|line| %w(jmp nop).include?(line[0])}.count

  cond = catch :get_out do
    while true
      if already_run.include?(i)
        puts "Infinite loop detected, try again!"
        throw :get_out, :infinite_loop
      end

      if jmp_nop_count == changed.count
        puts "Already changed anything!"
        throw :get_out, :end
      end

      if i == input.count
        puts "End!"
        throw(:get_out, :end)
      end

      if !already_changed && !changed.include?(i)
        if input[i][0] == "jmp"
          input[i][0] = "nop"
          changed << i
          already_changed = true
        elsif input[i][0] == "nop" && input[i][1] != 0
          input[i][0] = "jmp"
          changed << i
          already_changed = true
        end
      end

      already_run << i
      case input[i][0]
      when "acc"
        acc += input[i][1]
        i += 1
      when "jmp"
        i += input[i][1]
      when "nop"
        i += 1
      end
    end
  end
  break if cond == :end
end

puts acc
