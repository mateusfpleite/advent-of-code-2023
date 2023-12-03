MAX_CUBES = {blue: 14, red: 12, green: 13}

def extract_color_count(game, color)
  game.scan(/(\d{1,2}) #{color}/).map { |match| match.first.to_i }
end

def parse_game_line(game)
  game_id = game.match(/(\d+):/)[1].to_i
  {game_id: game_id, blues: extract_color_count(game, 'blue'), reds: extract_color_count(game, 'red'), greens: extract_color_count(game, 'green')}
end
def find_possible_games(games)
  possible_games = games.select do |game|
    game[:blues].none? {|n| n > MAX_CUBES[:blue]} &&
    game[:reds].none? {|n| n > MAX_CUBES[:red]} &&
    game[:greens].none? {|n| n > MAX_CUBES[:green]}
  end
  possible_games.map { |game| game[:game_id] }.reduce(:+)
end

def find_min_power_set_sum(games)
  games.map do |game|
    game[:blues].max * game[:reds].max * game[:greens].max
  end.reduce(:+)
end
def day_2_problems
  file_content = File.read('src/day2/day2input.txt')
  game_list = file_content.split("\n")
  parsed_games = game_list.map(&method(:parse_game_line))
  problem_1 = find_possible_games(parsed_games)
  problem_2 = find_min_power_set_sum(parsed_games)
  [problem_1, problem_2]
end

puts day_2_problems

