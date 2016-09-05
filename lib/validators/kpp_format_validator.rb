class KppFormatValidator < ValidatesRussian::Validator
  # see format here: http://vipiskaegrul.ru/slovar-terminov/kod-prichiny-postanovki-kpp.html
  validates_using do |kpp|
    next false unless kpp.size == 9
    next false unless ValidatesRussian::REGION_NUMBERS.include?(kpp[0..1])
    next false unless kpp =~ /^\d{4}([a-z]|\d){2}\d{3}$/i
  end
end
