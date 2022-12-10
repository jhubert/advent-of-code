tree_grid = File.read(ARGV[0]).split("\n").collect { |row| row.chars.collect(&:to_i) }

GRID_X_SIZE = tree_grid.first.length - 1
GRID_Y_SIZE = tree_grid.length - 1

def calculate_visible_distance(trees, height)
  trees_until_blocked = trees.index { |val| val >= height }
  trees_until_blocked ? trees_until_blocked + 1 : trees.length
end

def calculate_view(tree_grid, xpos, ypos)
  # Edges are always visible
  return 0 if xpos == 0 || ypos == 0 || xpos == GRID_X_SIZE || ypos == GRID_Y_SIZE

  height = tree_grid[ypos][xpos]

  max_left = calculate_visible_distance(tree_grid[ypos][0..(xpos - 1)].reverse, height)
  max_right = calculate_visible_distance(tree_grid[ypos][(xpos + 1)..-1], height)
  max_up = calculate_visible_distance(tree_grid[0..(ypos - 1)].collect { |row| row[xpos] }.reverse, height)
  max_down = calculate_visible_distance(tree_grid[(ypos + 1)..-1].collect { |row| row[xpos] }, height)

  max_left * max_right * max_up * max_down
end

scenic_scores = []

tree_grid.flatten.each_with_index do |tree, idx|
  xpos = idx % tree_grid.first.length
  ypos = idx / tree_grid.length

  scenic_scores << calculate_view(tree_grid, xpos, ypos)
end

puts "The highest scenic score is #{scenic_scores.max}"
