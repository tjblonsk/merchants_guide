require "minitest/autorun"
require './currency_repo'

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
        glob: 'I',
        prok: 'V',
        pish: 'X',
        tegj: 'L'
      }
    end

    it 'must set currencies' do
      @repo.currencies.must_equal @currencies
    end
  end
