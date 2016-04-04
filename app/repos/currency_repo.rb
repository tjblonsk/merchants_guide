# Given an array of input in form of 'currency is IV',
# sets a hash of currency values in @currencies.
class CurrencyRepo
  attr_reader :currencies

  def initialize(lines)
    @currencies = currencies(lines)
  end

  # currency_string => 'glob prok'
  def to_roman(currency_string)
    currency_string.split(' ').map { |currency| @currencies[currency] }.join('')
  end

  private

  def currencies(lines)
    lines.each_with_object({}) do |line, obj|
      currency       = line.match(/glob|prok|pish|tegj/)[0]
      numeral        = line.split(' ').last
      obj[currency]  = numeral
    end
  end
end
