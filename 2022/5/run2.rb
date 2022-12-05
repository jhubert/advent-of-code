raw_stack_data, moves_data = File.read(ARGV[0]).split("\n\n")

CRATE_MOVER_9001 = -> (crates, count, from, to) { crates[to].concat(crates[from].pop(count.to_i)) }

# Build the crate data into a usable hash
crate_stack_data = raw_stack_data.split("\n").reverse.collect { |row| row.chars.each_slice(4).collect { |slice| slice[1] } }

crate_numbers = crate_stack_data.shift
crates = Hash.new { |new_hash, key| new_hash[key] = [] }

crate_numbers.each do |number|
  crate_stack_data.each do |row|
    crate = row.shift

    crates[number] << crate unless crate.nil? || crate == " "
  end
end

# Run the moves list
moves_data.split("\n").each do |move|
  count, from, to = move.delete("^0-9\s").gsub(/\s+/, "\s").split("\s")

  CRATE_MOVER_9001.call(crates, count, from, to)
end

last_crates_in_each_stack = crates.collect { |_number, crate_name| crate_name.last }.join

puts "The Crate Mover 9001 will result in the following top crates in each stack: #{last_crates_in_each_stack}"
