require "minitest/autorun"
require './translator'

describe Translator do
  before do
    lines = File.open('./test/fixtures/input.txt').readlines
    @translator = Translator.new(lines)
    @output = [
      'pish tegj glob glob is 42',
      'glob prok Silver is 68 Credits',
      'glob prok Gold is 57800 Credits',
      'glob prok Iron is 782 Credits',
      'I have no idea what you are talking about'
    ]
  end

  describe 'output' do
    it 'must detect a currency totaling question and output the correct result' do
      @translator.translate_currency_questions.must_equal [@output[0]]
    end

    'It detects a mineral totaling question and outputs the correct result'
  end
end