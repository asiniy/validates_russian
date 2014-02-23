class OgrnFormatValidator < ValidatesRussian::Validator
  validates_using do |ogrn|
    next false unless ogrn =~ /^\d+$/

    case ogrn.size
    when 13 then next false unless (ogrn[0..-2].to_i % 11 % 10) == ogrn[-1].to_i
    when 15 then next false unless (ogrn[0..-2].to_i % 13 % 10) == ogrn[-1].to_i
    else next false
    end
  end
end
