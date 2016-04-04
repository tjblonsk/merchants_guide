class CurrencyRepo
  attr_reader :currencies

  def initialize(lines)
    @currencies = set_currencies(lines)
  end

  def to_roman(currency_string)
    # raise 'cannot convert' unless currency_string.is_a? String && currency_string =~ /glob|prok|pish|tegj/
    currency_string.split(' ').map { |currency| @currencies[currency] }.join('')
  end

  private

  def set_currencies(lines)
    lines.each_with_object({}) do |line, obj|
      currency       = line.match(/glob|prok|pish|tegj/)[0]
      numeral        = line.split(' ').last
      obj[currency]  = numeral
    end
  end
end
