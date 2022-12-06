datastream_buffer = File.read(ARGV[0])

MARKER_SIZE = 4

chars = datastream_buffer.chars
buffer = chars.shift(MARKER_SIZE - 1)

while chars.any?
  buffer << chars.shift

  break if buffer[-MARKER_SIZE..-1].uniq.count == MARKER_SIZE
end

puts "The first marker is at position #{buffer.length}"
