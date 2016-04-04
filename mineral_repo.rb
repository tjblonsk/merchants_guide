class MineralRepo
  attr_reader :minerals

  def initialize(lines, curreny_repo)
    @curreny_repo = curreny_repo
    @minerals = set_minerals(lines)
  end

  def set_minerals(lines)
    lines.each_with_object({}) do |line, obj|
      currencies = line.split(/\s(gold|silver|iron)/i)[0]
      mineral = line.match(/gold|silver|iron/i)[0]
      total_cost = line.match(/\n/)
      roman_string = @curreny_repo.to_roman(currencies)
      roman_string.to_arabic
      obj[mineral] = total_cost / currency_total
    end
  end
end
