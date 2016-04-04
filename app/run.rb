require './app/input/file_parser'
require './app/input/translator'
require './app/output/outputter'

begin
  lines = FileParser.new(ARGV[0]).parse_lines
  translator = Translator.new(lines)
  Outputter.new(translator).output
rescue => e
  $stdout.puts "Error: #{e.message}"
  $stdout.puts "Backtrace: #{e.backtrace.join("\n")}"
end
