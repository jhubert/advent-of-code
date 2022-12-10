tree_grid = File.read(ARGV[0]).split("\n").collect { |row| row.chars.collect(&:to_i) }

GRID_X_SIZE = tree_grid.first.length - 1
GRID_Y_SIZE = tree_grid.length - 1

def calculate_visibility(tree_grid, xpos, ypos)
  # Edges are always visible
  return true if xpos == 0 || ypos == 0 || xpos == GRID_X_SIZE || ypos == GRID_Y_SIZE

  height = tree_grid[ypos][xpos]

  max_left = tree_grid[ypos][0..(xpos - 1)].max
  max_right = tree_grid[ypos][(xpos + 1)..-1].max
  max_up = tree_grid[0..(ypos - 1)].collect { |row| row[xpos] }.max
  max_down = tree_grid[(ypos + 1)..-1].collect { |row| row[xpos] }.max

  [max_left, max_right, max_up, max_down].any? { |max| max < height }
end

visible_trees = 0

tree_grid.flatten.each_with_index do |tree, idx|
  xpos = idx % tree_grid.first.length
  ypos = idx / tree_grid.length

  visible = calculate_visibility(tree_grid, xpos, ypos)
  visible_trees += 1 if visible
end

puts "There are #{visible_trees} visible trees"
