require './app/repos/currency_repo'
require './app/repos/mineral_repo'
require './monkey_patches/string'

# Sorts lines of input.
# Passes currency and mineral value input to
# the respective repos.
# Translates currency and mineral totalling questions
# to human readable strings.
class Translator
  def initialize(lines)
    @lines          = lines
    @currency_repo  = CurrencyRepo.new(currency_lines)
    @mineral_repo   = MineralRepo.new(mineral_lines, @currency_repo)
  end

  def translate_currency_questions
    currency_question_lines.map do |line|
      currency_question_output(line)
    end
  end

  def translate_mineral_questions
    mineral_question_lines.map do |line|
      mineral_question_output(line)
    end
  end

  private

  # Matches 'glob is I'
  def currency_lines
    @lines.select { |line| line =~ /\w{4}\sis\s[A-Z]+$/ }
  end

  # Matches 'glob glob Silver is 34 Credits'
  def mineral_lines
    @lines.select { |line| line =~ /is\s\d+\sCredits$/ }
  end

  # Matches 'how much is pish tegj glob glob ?'
  def currency_question_lines
    @lines.select { |line| line =~ /^how much is/ }
  end

  # Matches 'how many Credits is glob prok Silver ?'
  def mineral_question_lines
    @lines.select { |line| line =~ /^how many Credits/ }
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
