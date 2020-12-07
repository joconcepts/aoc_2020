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

$contains_gold_bags = []

def contains_colored_bags(color, bags)
  contains = bags.select do |bag|
    bag[:content].select{|c| c[:color] == color && c[:amount] > 0}.any?
  end
  contains.each do |c|
    $contains_gold_bags << c[:bag]
    contains_colored_bags(c[:bag], bags)
  end
end

contains_colored_bags("shiny gold", bags)

puts $contains_gold_bags.flatten.uniq.count
