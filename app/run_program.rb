require './translator'

file_path = ARGV[0]
lines = File.open(file_path).readlines
translator = Translator.new(lines)

# @returns [String, String]
def output(translator)
  currency_question_output  = translator.translate_currency_questions
  mineral_question_output   = translator.translate_mineral_questions
  currency_question_output.concat(mineral_question_output)
end

output = output(translator)
output.each do |line|
  $stdout.puts line
end

$stdout.puts 'I have no idea what you are talking about' if output.empty?
