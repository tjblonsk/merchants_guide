require './monkey_patches/string'

# Given an array of input in form of 'glob glob Silver is 34 Credits',
# calculates the per unit value of each mineral and
# sets a hash of mineral values in @minerals.
class MineralRepo
  attr_reader :minerals

  def initialize(lines, curreny_repo)
    @curreny_repo = curreny_repo
    @minerals = mineral_values(lines)
  end

  def mineral_values(lines)
    lines.each_with_object({}) do |line, obj|
      obj[mineral(line)] = total_cost(line).to_f / currency_total(line).to_f
    end
  end

  private

  def mineral(line)
    line.match(/gold|silver|iron/i)[0]
  end

  def total_cost(line)
    line.match(/\d+/)[0].to_i
  end

  def currency_total(line)
    currencies    = line.split(/\s(gold|silver|iron)/i)[0]
    roman_string  = @curreny_repo.to_roman(currencies)
    roman_string.to_arabic
  end
end
