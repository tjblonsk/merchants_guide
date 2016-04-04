require 'minitest/autorun'
require './app/input/translator'
require './app/output/outputter'

describe Outputter do
  before do
    lines = File.open('./test/fixtures/input.txt').readlines
    @output = $stdout.puts output
    translator = Translator.new(lines)
    @outputter = Outputter.new(translator)
  end

  it 'must output translations' do
    proc { @outputter.output }.must_output(@output)
  end

  def output
    [
      'pish tegj glob glob is 42',
      'glob prok Silver is 68 Credits',
      'glob prok Gold is 57800 Credits',
      'glob prok Iron is 782 Credits',
      'I have no idea what you are talking about'
    ]
  end
end
