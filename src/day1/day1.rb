def find_first_digit(string)
  return "0" unless string
  string[/\d/] || "0"
end

def find_last_digit(string)
  return "0" unless string
  string.reverse[/\d/] || "0"
end

def replace_number_in_words(string)
  number_in_words = {
    'one' => '1', 'two' => '2', 'three' => '3', 'four' => '4',
    'five' => '5', 'six' => '6', 'seven' => '7', 'eight' => '8', 'nine' => '9'
  }
  replaced_string = string.gsub(/one|two|three|four|five|six|seven|eight|nine/, number_in_words)
end

def decode_values(replace_words = false)
  file_content = File.read('src/day1/day1input.txt')
  encoded_values = file_content.split("\n")
  normalized_encoded_values = replace_words ? encoded_values.map { |line| replace_number_in_words(line) } : encoded_values
  decoded_values = normalized_encoded_values.map do |value|
    (find_first_digit(value) + find_last_digit(value)).to_i
  end
  final_value = decoded_values.reduce(:+)
  final_value
end

def day_1_problems
  problem_1 = decode_values
  problem_2 = decode_values(replace_words = true)
  [problem_1, problem_2]
end

puts day_1_problems
