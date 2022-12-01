calorie_data = File.read(ARGV[0]).split("\n")

calories_by_elf = calorie_data.join(',').split(',,').collect { |group| group.split(',').sum { |v| v.to_i } }
top_3_calories = calories_by_elf.max(3).sum
max_calories = calories_by_elf.max
elf_number = calories_by_elf.index(max_calories) + 1

puts "3 elves are carrying #{top_3_calories} calories"
puts "Elf #{elf_number} is carrying the most with #{max_calories}"
