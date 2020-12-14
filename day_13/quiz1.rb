#!/usr/bin/env ruby

input = File.readlines("./input.txt")

my_timestamp = input.first.to_i
bus_ids = input.last.split(",").reject{|x| x == 'x'}.map(&:to_i)

new_bus_ids = bus_ids.map do |bus_id|
  arrival = my_timestamp - (my_timestamp % bus_id)
  new_arrival = arrival
  if my_timestamp - arrival < bus_id
    new_arrival += bus_id
  elsif my_timestamp - arrival > bus_id
    new_arrival += bus_id * 2
  end
  [bus_id, new_arrival]
end

next_bus = new_bus_ids.min_by do |bus_id, arrival|
  arrival
end

puts (next_bus[1] - my_timestamp) * next_bus[0]
