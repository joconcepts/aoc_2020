#!/usr/bin/env ruby

input = File.readlines("./input.txt")

bags = input.map do |line|
  matches = line.match(/^(.*) bags contain (.*)./)
  color = matches[1]
  content = matches[2].split(",").map do |bag|
    next nil if bag.strip == "no other bags"
    m = bag.strip.match(/^(\d+) (.*) bag(s?)/)
    {
      color: m[2],
      amount: m[1].to_i
    }
  end
  {
    bag: color,
    content: content.compact
  }
end

def count_content(bags, color)
  bag = bags.find do |b|
    b[:bag] == color
  end
  bag[:content].map do |c|
    c_c = count_content(bags, c[:color])
    c_c > 0 ? c_c * c[:amount] : c[:amount]
  end.sum + 1
end

puts count_content(bags, "shiny gold") - 1
