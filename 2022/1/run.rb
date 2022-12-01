calorie_data = File.read(ARGV[0]).split("\n\n")

calories_by_elf = calorie_data.collect { |group| group.split("\n").sum { |v| v.to_i } }
top_3_calories = calories_by_elf.max(3).sum
max_calories = calories_by_elf.max
elf_number = calories_by_elf.index(max_calories) + 1

puts "3 elves are carrying #{top_3_calories} calories"
puts "Elf #{elf_number} is carrying the most with #{max_calories}"
