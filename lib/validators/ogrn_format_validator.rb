class OgrnFormatValidator < ValidatesRussian::Validator
  validates_using do |ogrn|
    next false unless ogrn =~ /^\d+$/
    next false unless [13, 15].include?(ogrn.size)
    next false unless (ogrn[0..-2].to_i % (ogrn.size - 2) % 10) == ogrn[-1].to_i
  end
end
