require './currency_repo'
require './mineral_repo'
require './monkey_patches/string'

class Translator
  def initialize(lines)
    @lines = lines
    @currency_repo = CurrencyRepo.new(currency_lines)
    @mineral_repo = MineralRepo.new(mineral_lines, @currency_repo)
  end

  def translate_currency_questions
    currency_question_lines.map do |line|
      currency_string = line[/how much is\s(.*?)\s\?/, 1]
      roman_numeral_string = @currency_repo.to_roman(currency_string)
      "#{currency_string} is #{roman_numeral_string.to_arabic}"
    end
  end

  def translate_mineral_questions

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

  # Matchs 'how many Credits is glob prok Silver ?'
  def mineral_question_lines
    @lines.select { |line| line =~ /^how many Credits/ }
  end
end
