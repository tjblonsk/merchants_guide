require 'minitest/autorun'
require './app/input/translator'
require './app/output/outputter'

describe Outputter do
  before do
    lines = File.open('./test/fixtures/input.txt').readlines
    @output = $stdout.puts output(lines)
    translator = Translator.new(lines)
    @outputter = Outputter.new(translator)
  end

  it 'must output translations' do
    proc { @outputter.output }.must_output(@output)
  end

  def output(lines)
    [
      'pish tegj glob glob is 42',
      'glob prok Silver is 68 Credits',
      'glob prok Gold is 57800 Credits',
      'glob prok Iron is 782 Credits'
    ]
  end
end
