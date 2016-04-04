require './app/repos/currency_repo'
require './app/repos/mineral_repo'
require './monkey_patches/string'

# Sorts lines of input.
# Passes currency and mineral value input to
# the respective repos.
# Translates currency and mineral totalling questions
# to human readable strings.
class Translator
  INVALID_INPUT_RESPONSE = 'I have no idea what you are talking about'

  def initialize(lines)
    @line_hash      = group_lines(lines)
    @currency_repo  = CurrencyRepo.new(@line_hash[:currency])
    @mineral_repo   = MineralRepo.new(@line_hash[:mineral], @currency_repo)
  end

  def translate_currency_questions
    @line_hash[:currency_questions].map do |line|
      currency_question_output(line)
    end
  end

  def translate_mineral_questions
    @line_hash[:mineral_questions].map do |line|
      mineral_question_output(line)
    end
  end

  def invalid_input
    @line_hash[:invalid].map do |line|
      INVALID_INPUT_RESPONSE
    end
  end

  private

  def group_lines(lines)
    lines.each_with_object(init_line_hash) do |line, line_hash|
      # returns an array => [pattern, proc]
      proc = patterns.find { |pattern, proc| line =~ pattern }&.last
      proc ? proc.call(line, line_hash) : line_hash[:invalid] << line
    end
  end

  def patterns
    patterns = {
      # Matches 'glob is I'.
      /\w{4}\sis\s[A-Z]+$/  => -> (line, line_hash) { line_hash[:currency] << line },
      # Matches 'glob glob Silver is 34 Credits'.
      /is\s\d+\sCredits$/   => -> (line, line_hash) { line_hash[:mineral] << line },
      # Matches 'how much is pish tegj glob glob ?'.
      /^how much is/        => -> (line, line_hash) { line_hash[:currency_questions] << line },
      # Matches 'how many Credits is glob prok Silver ?'.
      /^how many Credits/   => -> (line, line_hash) { line_hash[:mineral_questions] << line }
    }
  end

  def init_line_hash
    {
      currency: [],
      mineral: [],
      currency_questions: [],
      mineral_questions: [],
      invalid: []
    }
  end

  def currency_question_output(line)
    currency = line[/how much is\s(.*?)\s\?/, 1]
    numeral  = @currency_repo.to_roman(currency)

    "#{currency} is #{numeral.to_arabic}"
  end

  def mineral_question_output(line)
    currency = line[/^how many Credits is\s(.*?)\s(gold|silver|iron)/i, 1]
    mineral  = line[/gold|silver|iron/i]
    numeral  = @currency_repo.to_roman(currency)
    total    = numeral.to_arabic * @mineral_repo.minerals[mineral]

    "#{currency} #{mineral} is #{total.round(0)} Credits"
  end
end
