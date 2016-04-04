require 'minitest/autorun'
require './monkey_patches/string'

describe String do
  it 'must convert a roman numeral to arabic' do
    'MMVI'.to_arabic.must_equal 2006
    'MCMXLIV'.to_arabic.must_equal 1944
  end
end
