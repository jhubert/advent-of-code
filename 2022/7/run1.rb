terminal_output = File.read(ARGV[0])

def calculate_directory_sizes(terminal_entries)
  directory_sizes = { '/' => 0 }
  current_path = '/'

  terminal_entries.each do |entry|
    case entry[0]
    when '$'
      value = entry.split(' ').last

      if value == 'ls'
        # do nothing
      elsif value == '..'
        current_path.sub!(/\.\w+$/, '')
      else
        current_path << ".#{value}" unless value == current_path
      end
    when /\d/
      file_size = entry.split(' ').first.to_i

      path_pieces = current_path.split('.')
      while path_pieces.any?
        path = path_pieces.join('.')
        directory_sizes[path] ||= 0
        directory_sizes[path] += file_size
        path_pieces.pop
      end
    end
  end

  directory_sizes
end

directory_sizes = calculate_directory_sizes(terminal_output.split("\n"))

sum_of_smaller_sizes = directory_sizes.reject { |key, total_size| total_size > 100000 }.values.sum

puts "The sum of all directories equal to or less than 100,000 is #{sum_of_smaller_sizes}."
