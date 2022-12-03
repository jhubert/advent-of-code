PRIORITY_MAP = [0, *('a'..'z'), *('A'..'Z')].freeze

list_of_contents = File.read(ARGV[0]).split("\n")

priority_score = 0

list_of_contents.each_slice(3) do |elf_group|
  badges = elf_group.inject do |result, rucksack|
    (result.chars & rucksack.chars).join
  end

  priority_score += PRIORITY_MAP.index(badges)
end

puts "The total priority score of the badges is #{priority_score}"
