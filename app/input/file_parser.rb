class FileParser
  def initialize(file_path)
    @file_path = file_path
  end

  def parse_lines_from_file
    check_path_presence
    parse_lines
  rescue => e
    p e.message
    $stdout.puts e.message
  end

  private

  def check_path_presence
    raise 'Please provide a valid file path' if @file_path.nil?
  end

  def parse_lines
    File.open(@file_path).readlines
  rescue => e
    raise "Error reading from file: #{e.message}."
  end
end