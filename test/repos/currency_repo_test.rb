require 'minitest/autorun'
require './app/repos/currency_repo'

describe CurrencyRepo do
  before do
    lines = [
      'glob is I',
      'prok is V',
      'pish is X',
      'tegj is L'
    ]
    @repo = CurrencyRepo.new(lines)
    @currencies = {
      'glob' => 'I',
      'prok' => 'V',
      'pish' => 'X',
      'tegj' => 'L'
    }
  end

  it 'must set currencies' do
    @repo.currencies.must_equal @currencies
  end

  it 'must return a roman numeral string given a hash of currency counts' do
    @repo.to_roman('glob prok').must_equal 'IV'
  end
end
