class PassportFormatValidator < ValidatesRussian::Validator
  # see format here: http://ru.wikipedia.org/wiki/Паспорт_гражданина_Российской_Федерации
  validates_using do |passport|
    next false unless passport =~ /^\d+$/
    next false unless ValidatesRussian::OKATO_REGION_NUMBERS.include?(passport[0..1])
    next false unless passport.size == 10
  end
end