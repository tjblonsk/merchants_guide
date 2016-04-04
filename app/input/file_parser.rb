# frozen_string_literal: true

# Given a path to a file located on the machine,
# opens the file and returns an array of lines.
class FileParser
  def initialize(file_path)
    @file_path = file_path
  end

  def parse_lines
    check_path_presence
    readlines
  end

  private

  def check_path_presence
    raise 'Please provide a valid file path' if @file_path.nil?
  end

  def readlines
    File.open(@file_path).readlines
  rescue => e
    raise "Error reading from file: #{e.message}."
  end
end
