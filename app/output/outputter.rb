class Outputter
  def initialize(translator)
    @translator = translator
  end

  def output
    translations = sum_translations
    raise 'Could not translate data' if translations.empty?
    translations.each { |line| $stdout.puts line }
  end

  private

  # @returns [String, String]
  def sum_translations
    currency_question_output  = @translator.translate_currency_questions
    mineral_question_output   = @translator.translate_mineral_questions
    currency_question_output.concat(mineral_question_output)
  end
end