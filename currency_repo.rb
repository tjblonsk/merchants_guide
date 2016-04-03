class CurrencyRepo
  attr_reader :currencies

  def initialize(lines)
    @currencies = set_currencies(lines)
  end

  def to_roman(currencies = {})

  end

  def set_currencies(lines)
    lines.each_with_object({}) do |line, obj|
      currency = line.match(/glob|prok|pish|tegj/)[0]
      numeral = line.split(' ').last
      obj[currency.to_sym] = numeral
    end
  end
end
