strategy = File.read(ARGV[0]).split("\n")

SCORES = {
 # Elf, Me, Play score, Result score
  "A X" => 1 + 3, # Rock draws Rock
  "A Y" => 2 + 6, # Rock loses to Paper
  "A Z" => 3 + 0, # Rock beats Scissors

  "B X" => 1 + 0, # Paper beats Rock
  "B Y" => 2 + 3, # Paper draws Paper
  "B Z" => 3 + 6, # Paper loses to Scissors

  "C X" => 1 + 6, # Scissors loses to Rock
  "C Y" => 2 + 0, # Scissors beats Paper
  "C Z" => 3 + 3  # Scissors draws Scissors
}

puts strategy.collect { |play| SCORES[play] }.sum
