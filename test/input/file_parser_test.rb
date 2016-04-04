require 'minitest/autorun'
require './app/input/file_parser'

describe FileParser do
  before do
    @path = './test/fixtures/input.txt'
    @file_parser = FileParser.new(@path)
    @invalid_parser = FileParser.new(nil)
  end

  it 'must parse a txt file into an array of lines' do
    @file_parser.parse_lines_from_file.must_equal File.open(@path).readlines
  end

  it 'must output an error if no file path is provided' do
    output = $stdout.puts 'Please provide a valid file path'
    proc { @invalid_parser.parse_lines_from_file }.must_output(output)
  end
end
