strategy = File.read(ARGV[0]).split("\n")

SCORES = {
 # Elf, Result, Play score, Result score
  "A X" => 3 + 0, # Rock beats Scissors
  "A Y" => 1 + 3, # Rock draws Rock
  "A Z" => 2 + 6, # Rock loses to Paper

  "B X" => 1 + 0, # Paper beats Rock
  "B Y" => 2 + 3, # Paper draws Paper
  "B Z" => 3 + 6, # Paper loses to Scissors

  "C X" => 2 + 0, # Scissors beats Paper
  "C Y" => 3 + 3, # Scissors draws Scissors
  "C Z" => 1 + 6  # Scissors loses to Rock
}

final_score = strategy.collect { |play| SCORES[play] }.sum

puts "The final score will be #{final_score}."
