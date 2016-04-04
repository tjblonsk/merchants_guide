require './translator'

file_path = ARGV[0]
lines = File.open(file_path).readlines
translator = Translator.new(lines)
currency_question_output = translator.translate_currency_questions
currency_question_output.each do |line|
  p line
end

if currency_question_output.empty?
  p 'I have no idea what you are talking about'
end
