# frozen_string_literal: true
require 'minitest/autorun'
require './app/input/file_parser'

describe FileParser do
  before do
    @path = './test/fixtures/input.txt'
    @file_parser = FileParser.new(@path)
    @invalid_parser = FileParser.new(nil)
  end

  it 'must parse a txt file into an array of lines' do
    @file_parser.parse_lines.must_equal File.open(@path).readlines
  end

  it 'must raise an error if no file path is provided' do
    proc { @invalid_parser.parse_lines }.must_raise(RuntimeError)
  end
end
