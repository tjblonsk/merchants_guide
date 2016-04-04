require "minitest/autorun"
require './mineral_repo'
require './currency_repo'

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
        'Gold' => 14450,
        'Silver' => 17,
        'Iron' => 195.5
      }
    end

    it 'must set mineral prices' do
      @repo.minerals.must_equal @minerals
    end
  end
