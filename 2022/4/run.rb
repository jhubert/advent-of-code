assignments = File.read(ARGV[0]).split("\n")

fully_contained_pairs = 0
overlapping_pairs = 0

assignments.each do |assignment|
  elf1, elf2 = assignment.split(',').collect { |elf| eval(elf.sub('-', '..')).to_a }

  overlapping_pairs += 1 if (elf1 & elf2).any?
  fully_contained_pairs += 1 if (elf1 - elf2).empty? || (elf2 - elf1).empty?
end

puts "There are #{fully_contained_pairs} fully contained pairs and #{overlapping_pairs} overlapping ones"
