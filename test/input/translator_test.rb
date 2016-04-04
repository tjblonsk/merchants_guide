require 'minitest/autorun'
require './app/input/translator'
require './app/repos/currency_repo'
require './app/repos/mineral_repo'

describe Translator do
  before do
    lines = File.open('./test/fixtures/input.txt').readlines
    @translator = Translator.new(lines)
    @currency_translation = ['pish tegj glob glob is 42']
    @mineral_translation  = [
      'glob prok Silver is 68 Credits',
      'glob prok Gold is 57800 Credits',
      'glob prok Iron is 782 Credits'
    ]
  end

  describe 'output' do
    it 'must detect a currency totaling question and output the correct result' do
      @translator.translate_currency_questions.must_equal @currency_translation
    end

    it 'detects a mineral totaling question and outputs the correct result' do
      @translator.translate_mineral_questions.must_equal @mineral_translation
    end
  end
end
