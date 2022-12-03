PRIORITY_MAP = [0, *('a'..'z'), *('A'..'Z')].freeze

list_of_contents = File.read(ARGV[0]).split("\n")

priority_score = list_of_contents.collect do |rucksack|
  first_compartment, second_compartment = rucksack.chars.each_slice(rucksack.length / 2).map(&:join)
  common_item = (first_compartment.chars & second_compartment.chars).first
  PRIORITY_MAP.index(common_item)
end.sum

puts "The total priority score of the common items is #{priority_score}"
