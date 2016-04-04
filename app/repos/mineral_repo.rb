require './monkey_patches/string'

class MineralRepo
  attr_reader :minerals

  def initialize(lines, curreny_repo)
    @curreny_repo = curreny_repo
    @minerals = set_minerals(lines)
  end

  def set_minerals(lines)
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
