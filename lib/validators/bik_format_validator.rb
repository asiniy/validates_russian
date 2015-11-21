class BikFormatValidator < ValidatesRussian::Validator
  validates_using do |bik|
    next false unless bik =~ /^\d+$/
    next false unless bik.length == 9
    next false unless bik[0..1] == '04'
    next false unless ValidatesRussian::OKATO_REGION_NUMBERS.include?(bik[2..3])
  end
end
