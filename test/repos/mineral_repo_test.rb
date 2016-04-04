require 'minitest/autorun'
require './app/repos/mineral_repo'
require './app/repos/currency_repo'

  describe MineralRepo do
    before do
      currency_lines = [
        'glob is I',
        'prok is V',
        'pish is X',
        'tegj is L'
      ]
      mineral_lines = [
        'glob glob Silver is 34 Credits',
        'glob prok Gold is 57800 Credits',
        'pish pish Iron is 3910 Credits'
      ]
      currency_repo = CurrencyRepo.new(currency_lines)
      @mineral_repo = MineralRepo.new(mineral_lines, currency_repo)
      @minerals = {
        'Silver' => 17,
        'Gold' => 14450,
        'Iron' => 195.5
      }
    end

    it 'must set mineral prices' do
      @mineral_repo.minerals.must_equal @minerals
    end
  end
