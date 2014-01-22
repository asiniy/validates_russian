class OgrnFormatValidator < ValidatesRussian::Validator
  validates_using do |ogrn|
    next false unless ogrn =~ /^\d+$/
    next false if ogrn.size != 13 && ogrn.size != 15

    if ogrn.size == 13
      next false unless (ogrn[0..-2].to_i % 11 % 10) == ogrn[-1].to_i
    end

    if ogrn.size == 15
      next false unless (ogrn[0..-2].to_i % 13 % 10) == ogrn[-1].to_i
    end
  end
end