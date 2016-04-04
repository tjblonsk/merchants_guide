# frozen_string_literal: true

# Monkey patches for String class.
# Use sparingly.
class String
  ROMAN_NUMS = {
    'M'  => 1000,
    'CM' => 900,
    'D'  => 500,
    'CD' => 400,
    'C'  => 100,
    'XC' => 90,
    'L'  => 50,
    'XL' => 40,
    'X'  => 10,
    'IX' => 9,
    'V'  => 5,
    'IV' => 4,
    'I'  => 1
  }.freeze

  # 'IVX' => 14
  def to_arabic
    string = upcase
    total = 0
    ROMAN_NUMS.each do |numeral, value|
      while string.index(numeral) == 0
        total += value
        string.slice!(numeral)
      end
    end

    total
  end
end
