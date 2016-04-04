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
  }

  def to_arabic
    str = self.upcase
    total = 0
    ROMAN_NUMS.each do |numeral, value|
      while str.index(numeral) == 0
        total += value
        str.slice!(numeral)
      end
    end

    total
  end
end
